# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'bible'
    fill_in "book[author]", with: 'God'
    fill_in "book[price]", with: '100'
    fill_in "book[published]", with: '1/1/1'
    fill_in "book[version]", with: '3'
    

    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('bible')
    expect(page).to have_content('God')
    expect(page).to have_content('100')
    expect(page).to have_content('0001-01-01')
    expect(page).to have_content('3')
  end
end