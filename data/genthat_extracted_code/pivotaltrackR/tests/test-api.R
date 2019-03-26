context("API wrapping")

with_mock_API({
    test_that("Handling when pivotal.project is not set", {
        old <- options(pivotal.project=NULL)
        on.exit(do.call(options, old))
        expect_error(ptGET(pivotalURL("test")),
            "No PivotalTracker project ID set. Provide it with 'options(pivotal.project=YOURID)'",
            fixed=TRUE)
    })
})
