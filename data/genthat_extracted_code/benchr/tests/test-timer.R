context("Timer")

test_that("'timer_precision' return correct object", {
    expect_is(timer_precision(), "numeric")
    expect_length(timer_precision(), 1L)
})

test_that("Timer precision less then 1 millisecond", {
    expect_lte(timer_precision(), 1e-3)
})

test_that("'timer_error' return correct object", {
    expect_is(timer_error(), "numeric")
    expect_length(timer_error(), 1L)
})

test_that("Timer error greater then 0", {
    expect_gt(timer_error(), 0)
})

test_that("Test 'do_timing' and 'Sys.sleep'", {
    skip_on_os("windows")
    expect_gte(do_timing(quote(Sys.sleep(0.1)), .GlobalEnv), 0.1)
    expect_gte(do_timing(quote(Sys.sleep(0.2)), .GlobalEnv), 0.2)
    expect_gte(do_timing(quote(Sys.sleep(0.3)), .GlobalEnv), 0.3)
})

test_that("'do_timing' result greater then timer error", {
    expect_gte(do_timing(quote(2^8), .GlobalEnv), timer_error())
})

test_that("'do_benchmark' return correct object", {
    b <- do_benchmark(1, .GlobalEnv, rep(1, 10), FALSE)
    expect_is(b, "numeric")
    expect_length(b, 10L)
})
