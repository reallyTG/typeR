context("Testing set-misc.R/setequal_na()")

test_that("set_equal_na() works when na.rm = TRUE", {
    x <- c(1, 2)
    y <- c(NA, 1, 2)
    result <- setequal_na(x, y, na.rm = TRUE)

    expect_equal(result, TRUE)
})

test_that("set_equal_na() works when na.rm = FALSE", {
    x <- c(1, 2)
    y <- c(NA, 1, 2)
    result <- setequal_na(x, y, na.rm = FALSE)

    expect_equal(result, FALSE)
})

test_that("set_equal_na() works when na.rm = TRUE, multiple NAs", {
    x <- c(1, 2, NA, NA)
    y <- c(NA, 1, 2)
    result <- setequal_na(x, y, na.rm = TRUE)

    expect_equal(result, TRUE)
})

test_that("set_equal_na() works when na.rm = TRUE, only NAs", {
    x <- c(NA, NA)
    y <- c(NA, NA, NA)
    result <- setequal_na(x, y, na.rm = TRUE)

    expect_equal(result, TRUE)
})

test_that("set_equal_na() works when na.rm = FALSE, only NAs", {
    x <- c(NA, NA, NA, NA)
    y <- c(NA, NA, NA)
    result <- setequal_na(x, y, na.rm = FALSE)

    expect_equal(result, TRUE)
})
