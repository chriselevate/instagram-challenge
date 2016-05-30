require 'rails_helper'

feature 'Editing posts' do
  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Needed to change the caption on this one"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Needed to change the caption on this one")
  end

  it "won't update a post without an image" do
    attach_file('Image', 'spec/files/maldives.zip')
    click_button 'Update Post'


    expect(page).to have_content("Update failed. Please check the form.")
  end
end