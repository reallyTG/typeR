context("Get stories")

test_that("buildFilter query construction", {
    expect_identical(buildFilter(list(
            type="Release",
            state="accepted",
            includedone="true"
        )),
        "type:Release state:accepted includedone:true")
})

test_that("buildFilter query construction with labels", {
    expect_identical(buildFilter(list(
            state="started",
            label=c("important", "customer")
        )),
        'state:started (label:"important" OR label:"customer")')
    expect_identical(buildFilter(list(
            state="started",
            label="important"
        )),
        'state:started label:"important"')
})

without_internet({
    test_that("A valid request is made, with the right headers", {
        expect_header(
            expect_GET(getStories(),
                "https://www.pivotaltracker.com/services/v5/projects/123/stories"),
            "X-TrackerToken: rekcarTlatoviP")
        expect_header(
            expect_GET(getStories(state="finished"),
                "https://www.pivotaltracker.com/services/v5/projects/123/stories?filter=state%3Afinished"),
            "pivotaltrackR") # user-agent
    })
    test_that("Search term is passed through", {
        expect_GET(getStories(search="foo"),
            "https://www.pivotaltracker.com/services/v5/projects/123/stories?filter=foo")
        expect_GET(getStories(state="finished", search="foo"),
            "https://www.pivotaltracker.com/services/v5/projects/123/stories?filter=state%3Afinished%20foo")
    })
})

public({
    with_mock_API({
        s <- getStories(search="mnt")
        test_that("The stories response and as.data.frame", {
            expect_length(s, 4)
            df <- as.data.frame(s)
            expect_identical(dim(df), c(4L, 13L))
            expect_identical(names(df),
                c("kind", "id", "created_at", "updated_at", "story_type",
                  "name", "description", "current_state", "requested_by_id",
                  "url", "project_id", "owner_ids", "labels"))
            expect_identical(df$story_type,
                c("chore", "feature", "feature", "bug"))
            expect_is(df$created_at, "POSIXt")
        })

        test_that("stories print method", {
            ## TODO: something less lame!
            expect_output(print(s))
        })

        test_that("Extract method for stories", {
            s <- getStories(search="mnt")
            expect_length(s, 4)
            expect_length(s[2:3], 2)
        })

        test_that("Bad request error handling", {
            expect_error(getStories(created="-5days..now"),
                "The date you requested could not be parsed")
        })

        test_that("as.data.frame when getStories returns 0 stories", {
            s <- getStories(label="NOT A LABEL")
            expect_length(s, 0)
            expect_is(as.data.frame(s), "data.frame")
        })

        test_that("getStories when there is pagination", {
            s <- getStories(label="really common label")
            expect_length(s, 5)
        })
    })
})
# print(str(getStories(state="accepted", accepted="-2days..today")))
