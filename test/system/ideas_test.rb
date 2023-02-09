require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  setup do
    @idea = ideas(:first) # Reference to the first fixture idea
  end

  test "Creating a new idea" do
    # When we visit the Ideas#index page
    # we expect to see a title with the text "Ideas"
    visit ideas_path
    assert_selector "h1", text: "Ideas"

    # When we click on the link with the text "New idea"
    # we expect to land on a page with the title "New idea"
    click_on "New idea"
    assert_selector "h1", text: "New idea"

    # When we fill in the name input with "Capybara idea"
    # and we click on "Create Idea"
    fill_in "Name", with: "Capybara idea"
    click_on "Create idea"

    # We expect to be back on the page with the title "Ideas"
    # and to see our "Capybara idea" added to the list
    assert_selector "h1", text: "Ideas"
    assert_text "Capybara idea"
  end

  test "Showing a idea" do
    visit ideas_path
    click_link @idea.name

    assert_selector "h1", text: @idea.name
  end

  test "Updating a idea" do
    visit ideas_path
    assert_selector "h1", text: "Ideas"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit idea"

    fill_in "Name", with: "Updated idea"
    click_on "Update idea"

    assert_selector "h1", text: "Ideas"
    assert_text "Updated idea"
  end

  test "Destroying a idea" do
    visit ideas_path
    assert_text @idea.name

    click_on "Delete", match: :first
    assert_no_text @idea.name
  end
end
