context("Asking questions")

test_that("we can ask questions and prompt for responses", {
    setOutputLevel(OL$Info)
    
    # Mock the absence or presence of interactivity for ask()
    with_mock(`reportr:::.interactive` = function() FALSE,
        expect_false(reportr:::.interactive()),
        expect_null(ask("This question will not be answered")),
        expect_equal(ask("This question will be answered with 'y'",default="y"), "y")
    )
    
    with_mock(`reportr:::.interactive` = function() TRUE, `reportr:::.readline` = function(...) "y",
        expect_true(reportr:::.interactive()),
        expect_equal(ask("This question will be answered with 'y'"), "y"),
        expect_equal(ask("This question will be answered with 'Y'",valid=c("Y","N")), "Y")
    )
})
