context("Testing warning function")


test_that("clear_warnings works", {
    assign("last.warning", "Warning error", envir = baseenv())
    last_warning <- baseenv()[["last.warning"]]
    expect_equal(length(last_warning), 1)
    
    clear_warnings()
    
    last_warning <- baseenv()[["last.warning"]]
    expect_equal(length(last_warning), 0)
})
