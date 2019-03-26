context("Story CRUD API")

test_that("storyURL", {
    expected <- "https://www.pivotaltracker.com/services/v5/projects/123/stories/90210234/"
    expect_identical(storyURL(90210234), expected)
    expect_identical(storyURL("90210234"), expected)
    expect_identical(storyURL(expected), expected)
    expect_identical(storyURL(as.story(list(id=90210234))), expected)
    expect_error(storyURL("abc"), "Invalid story: abc")
    expect_error(storyURL(NULL), "Invalid story: object of class NULL")
    expect_error(storyURL("https://www.pivotaltracker.com/services/v5/projects/123/stories/"))
    expect_error(storyURL("https://www.pivotaltracker.com/services/v5/projects/123/stories/90210234/labels/"))
})

public({
    with_mock_API({
        s <- createStory(name="A test story", story_type="chore")
        test_that("createStory", {
            expect_is(s, "story")
            expect_identical(s$name, "A test story")
        })
        test_that("story print method", {
            ## TODO: something less lame!
            expect_output(print(s))
        })
        test_that("the story we created really exists", {
            s2 <- getStory(s$id)
            expect_identical(s2$name, "A test story")
        })
        test_that("editStory", {
            s <- editStory(s, current_state="started")
            expect_identical(s$current_state, "started")
        })
        test_that("deleteStory", {
            expect_null(deleteStory(s))
        })
    })
})
