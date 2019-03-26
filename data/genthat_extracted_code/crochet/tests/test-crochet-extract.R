context("requirements for [")

test_that("lengths are the same", {

    expect_equal(length(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), length(CROCHET_EXTRACT_ENV$COMPARE_OBJECT))

})

test_that("dims are the same", {

    expect_equal(dim(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), dim(CROCHET_EXTRACT_ENV$COMPARE_OBJECT))

})

test_that("dimnames are the same", {

    expect_equal(dimnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), dimnames(CROCHET_EXTRACT_ENV$COMPARE_OBJECT))

})

test_that("minimum dimension requirement are met", {

    expect_gt(nrow(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), 3)
    expect_gt(ncol(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), 3)
    expect_gt(length(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), 3)

})

test_that("maximum dimension requirement are met", {

    expect_lt(nrow(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)
    expect_lt(ncol(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)
    expect_lt(length(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)

})


context("[")

test_subsetting <- function(...) {

    # Check default drop behavior
    expect_equal(
        CROCHET_EXTRACT_ENV$CUSTOM_OBJECT[...],
        CROCHET_EXTRACT_ENV$COMPARE_OBJECT[...],
        info = paste0("INFO: ", deparse(match.call()))
    )

    # Check explicit drop = TRUE
    expect_equal(
        CROCHET_EXTRACT_ENV$CUSTOM_OBJECT[..., drop = TRUE],
        CROCHET_EXTRACT_ENV$COMPARE_OBJECT[..., drop = TRUE],
        info = paste0("INFO: ", deparse(match.call()), " (with drop = TRUE)")
    )

    # Check explicit drop = FALSE
    expect_equal(
        CROCHET_EXTRACT_ENV$CUSTOM_OBJECT[..., drop = FALSE],
        CROCHET_EXTRACT_ENV$COMPARE_OBJECT[..., drop = FALSE],
        info = paste0("INFO: ", deparse(match.call()), " (with drop = FALSE)")
    )

}

test_subsetting_error <- function(...) {

    # Check default drop behavior
    expect_error(
        CROCHET_EXTRACT_ENV$CUSTOM_OBJECT[...],
        info = paste0("INFO: ", deparse(match.call()))
    )
    expect_error(
        CROCHET_EXTRACT_ENV$COMPARE_OBJECT[...],
        info = paste0("INFO: ", deparse(match.call()))
    )

    # Check explicit drop = TRUE
    expect_error(
        CROCHET_EXTRACT_ENV$CUSTOM_OBJECT[..., drop = TRUE],
        info = paste0("INFO: ", deparse(match.call()), " (with drop = TRUE)")
    )
    expect_error(
        CROCHET_EXTRACT_ENV$COMPARE_OBJECT[..., drop = TRUE],
        info = paste0("INFO: ", deparse(match.call()), " (with drop = TRUE)")
    )

    # Check explicit drop = FALSE
    expect_error(
        CROCHET_EXTRACT_ENV$CUSTOM_OBJECT[..., drop = FALSE],
        info = paste0("INFO: ", deparse(match.call()), " (with drop = FALSE)")
    )
    expect_error(
        CROCHET_EXTRACT_ENV$COMPARE_OBJECT[..., drop = FALSE],
        info = paste0("INFO: ", deparse(match.call()), " (with drop = FALSE)")
    )

}

test_that("single indexing by nothing works", {

    test_subsetting()

})

test_that("single indexing by positive integers works", {

    test_subsetting(1)
    test_subsetting(c(1, 2))
    test_subsetting(c(2, 1))
    test_subsetting(1.1)
    test_subsetting(c(1.1, 2.1))
    test_subsetting(c(2.1, 1.1))
    test_subsetting(1.9)
    test_subsetting(c(1.9, 2.9))
    test_subsetting(c(2.9, 1.9))
    test_subsetting(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)
    test_subsetting(c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, 2))
    test_subsetting(c(2, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    m <- matrix(data = c(1, 1, 2, 2), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(1, 1, 2, 2), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(2, 2, 1, 1), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(1.1, 1.1, 2.1, 2.1), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(2.1, 2.1, 1.1, 1.1), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(1.9, 1.9, 2.9, 2.9), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(2.9, 2.9, 1.9, 1.9), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), ncol = 2, byrow = TRUE)
    test_subsetting_error(m)

})

test_that("single indexing by negative integers works", {

    test_subsetting(-1)
    test_subsetting(c(-1, -2))
    test_subsetting(c(-2, -1))
    test_subsetting(-1.1)
    test_subsetting(c(-1.1, -2.1))
    test_subsetting(c(-2.1, -1.1))
    test_subsetting(-1.9)
    test_subsetting(c(-1.9, -2.9))
    test_subsetting(c(-2.9, -1.9))
    test_subsetting(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)
    test_subsetting(c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, -2))
    test_subsetting(c(-2, -CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))

})

test_that("single indexing by logicals works", {

    test_subsetting(TRUE)
    test_subsetting(FALSE)
    test_subsetting(c(TRUE, FALSE))
    test_subsetting(c(FALSE, TRUE))
    test_subsetting(rep_len(TRUE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(rep_len(FALSE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(rep_len(c(TRUE, FALSE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(rep_len(c(FALSE, TRUE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    m <- matrix(data = rnorm(length(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)), nrow = nrow(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT), ncol = ncol(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT))
    test_subsetting(m > 1)

})

test_that("single indexing by characters works", {

    if (is.null(dimnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT))) {
        skip("skipping character indexing because dimnames are NULL")
    }

    ROW_NAME_1 <- rownames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]
    ROW_NAME_2 <- rownames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[2]
    COL_NAME_1 <- colnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]
    COL_NAME_2 <- colnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[2]

    test_subsetting(ROW_NAME_1)
    test_subsetting(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR)
    m <- matrix(data = c(ROW_NAME_1, COL_NAME_1, ROW_NAME_2, COL_NAME_2), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(ROW_NAME_2, COL_NAME_2, ROW_NAME_1, COL_NAME_1), ncol = 2, byrow = TRUE)
    test_subsetting(m)
    m <- matrix(data = c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR), ncol = 2, byrow = TRUE)
    test_subsetting_error(m)

})

test_that("single indexing by NA works", {

    if (!is.null(CROCHET_EXTRACT_ENV$SKIP_NA_TESTS) && CROCHET_EXTRACT_ENV$SKIP_NA_TESTS) {
        skip("skipping NA tests because tests were explicitly disabled")
    }

    ROW_NAME_1 <- rownames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]

    test_subsetting(NA)
    test_subsetting(NA_integer_)
    test_subsetting(NA_character_)
    test_subsetting(c(1, NA))
    test_subsetting_error(c(-1, NA))
    test_subsetting(c(TRUE, NA))
    test_subsetting(c(FALSE, NA))
    test_subsetting(c(ROW_NAME_1, NA))

})

test_that("single indexing by zero works", {

    # Not implemented
    # test_subsetting_error(0)

    test_subsetting(c(0, 1))
    test_subsetting(c(0, -1))
    test_subsetting_error(c(0, 1, -1))

})

test_that("multi indexing by nothing works", {

    test_subsetting(, )

})

test_that("multi indexing by positive integers works", {

    test_subsetting(1, )
    test_subsetting(, 1)
    test_subsetting(1, 1)
    test_subsetting(c(1, 2), )
    test_subsetting(, c(1, 2))
    test_subsetting(c(1, 2), c(1, 2))
    test_subsetting(c(2, 1), )
    test_subsetting(, c(2, 1))
    test_subsetting(c(2, 1), c(2, 1))
    test_subsetting(1.1, )
    test_subsetting(, 1.1)
    test_subsetting(1.1, 1.1)
    test_subsetting(c(1.1, 2.1), )
    test_subsetting(, c(1.1, 2.1))
    test_subsetting(c(1.1, 2.1), c(1.1, 2.1))
    test_subsetting(c(2.1, 1.1), )
    test_subsetting(, c(2.1, 1.1))
    test_subsetting(c(2.1, 1.1), c(2.1, 1.1))
    test_subsetting(1.9, )
    test_subsetting(, 1.9)
    test_subsetting(1.9, 1.9)
    test_subsetting(c(1.9, 2.9), )
    test_subsetting(, c(1.9, 2.9))
    test_subsetting(c(1.9, 2.9), c(1.9, 2.9))
    test_subsetting(c(2.9, 1.9), )
    test_subsetting(, c(2.9, 1.9))
    test_subsetting(c(2.9, 1.9), c(2.9, 1.9))
    test_subsetting_error(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, )
    test_subsetting_error(, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)
    test_subsetting_error(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)
    test_subsetting_error(c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, 2), )
    test_subsetting_error(, c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, 2))
    test_subsetting_error(c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, 2), c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, 2))
    test_subsetting_error(c(2, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), )
    test_subsetting_error(, c(2, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting_error(c(2, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), c(2, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))

})

test_that("multi indexing by negative integers works", {

    test_subsetting(c(-1), )
    test_subsetting(, c(-1))
    test_subsetting(c(-1), c(-1))
    test_subsetting(c(-1, -2), )
    test_subsetting(, c(-1, -2))
    test_subsetting(c(-1, -2), c(-1, -2))
    test_subsetting(c(-2, -1), )
    test_subsetting(, c(-2, -1))
    test_subsetting(c(-2, -1), c(-2, -1))
    test_subsetting(c(-1.1), )
    test_subsetting(, c(-1.1))
    test_subsetting(c(-1.1), c(-1.1))
    test_subsetting(c(-1.1, -2.1), )
    test_subsetting(, c(-1.1, -2.1))
    test_subsetting(c(-1.1, -2.1), c(-1.1, -2.1))
    test_subsetting(c(-2.1, -1.1), )
    test_subsetting(, c(-2.1, -1.1))
    test_subsetting(c(-2.1, -1.1), c(-2.1, -1.1))
    test_subsetting(c(-1.9), )
    test_subsetting(, c(-1.9))
    test_subsetting(c(-1.9), c(-1.9))
    test_subsetting(c(-1.9, -2.9), )
    test_subsetting(, c(-1.9, -2.9))
    test_subsetting(c(-1.9, -2.9), c(-1.9, -2.9))
    test_subsetting(c(-2.9, -1.9), )
    test_subsetting(, c(-2.9, -1.9))
    test_subsetting(c(-2.9, -1.9), c(-2.9, -1.9))
    test_subsetting(c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), )
    test_subsetting(, c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, -2), )
    test_subsetting(, c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, -2))
    test_subsetting(c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, -2), c(-CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT, -2))
    test_subsetting(c(-2, -CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), )
    test_subsetting(, c(-2, -CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(c(-2, -CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), c(-2, -CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))

})

test_that("multi indexing by logicals works", {

    test_subsetting(c(TRUE), )
    test_subsetting(, c(TRUE))
    test_subsetting(c(TRUE), c(TRUE))
    test_subsetting_error(c(rep_len(TRUE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)), )
    test_subsetting_error(, c(rep_len(TRUE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)))
    test_subsetting_error(c(rep_len(TRUE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)), c(rep_len(TRUE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)))
    test_subsetting(c(FALSE), )
    test_subsetting(, c(FALSE))
    test_subsetting(c(FALSE), c(FALSE))
    test_subsetting_error(c(rep_len(FALSE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)), )
    test_subsetting_error(, c(rep_len(FALSE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)))
    test_subsetting_error(c(rep_len(FALSE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)), c(rep_len(FALSE, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT)))
    test_subsetting(c(TRUE, FALSE), )
    test_subsetting(, c(TRUE, FALSE))
    test_subsetting(c(TRUE, FALSE), c(TRUE, FALSE))
    test_subsetting_error(rep_len(c(TRUE, FALSE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), )
    test_subsetting_error(, rep_len(c(TRUE, FALSE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting_error(rep_len(c(TRUE, FALSE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), rep_len(c(TRUE, FALSE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting(c(FALSE, TRUE), )
    test_subsetting(, c(FALSE, TRUE))
    test_subsetting(c(FALSE, TRUE), c(FALSE, TRUE))
    test_subsetting_error(rep_len(c(FALSE, TRUE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), )
    test_subsetting_error(, rep_len(c(FALSE, TRUE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))
    test_subsetting_error(rep_len(c(FALSE, TRUE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT), rep_len(c(FALSE, TRUE), CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_INT))

})

test_that("multi indexing by characters works", {

    if (is.null(dimnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT))) {
        skip("skipping character indexing because dimnames are NULL")
    }

    ROW_NAME_1 <- rownames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]
    ROW_NAME_2 <- rownames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[2]
    COL_NAME_1 <- colnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]
    COL_NAME_2 <- colnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[2]

    test_subsetting(ROW_NAME_1, )
    test_subsetting(, COL_NAME_1)
    test_subsetting(ROW_NAME_1, COL_NAME_1)
    test_subsetting_error(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, )
    test_subsetting_error(, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR)
    test_subsetting_error(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR)
    test_subsetting(c(ROW_NAME_1, ROW_NAME_2), )
    test_subsetting(, c(COL_NAME_1, COL_NAME_2))
    test_subsetting(c(ROW_NAME_1, ROW_NAME_2), c(COL_NAME_1, COL_NAME_2))
    test_subsetting(c(ROW_NAME_2, ROW_NAME_1), )
    test_subsetting(, c(COL_NAME_2, COL_NAME_1))
    test_subsetting(c(ROW_NAME_2, ROW_NAME_1), c(COL_NAME_2, COL_NAME_1))
    test_subsetting_error(c(ROW_NAME_1, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR), )
    test_subsetting_error(, c(COL_NAME_1, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR))
    test_subsetting_error(c(ROW_NAME_1, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR), c(COL_NAME_1, CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR))
    test_subsetting_error(c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, ROW_NAME_1), )
    test_subsetting_error(, c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, COL_NAME_1))
    test_subsetting_error(c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, ROW_NAME_1), c(CROCHET_EXTRACT_ENV$OUT_OF_BOUNDS_CHAR, COL_NAME_1))

})

test_that("multi indexing by NA works", {

    if (!is.null(CROCHET_EXTRACT_ENV$SKIP_NA_TESTS) && CROCHET_EXTRACT_ENV$SKIP_NA_TESTS) {
        skip("skipping NA tests because tests were explicitly disabled")
    }

    ROW_NAME_1 <- rownames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]
    COL_NAME_1 <- colnames(CROCHET_EXTRACT_ENV$CUSTOM_OBJECT)[1]

    test_subsetting(NA, )
    test_subsetting(, NA)
    test_subsetting(NA, NA)
    test_subsetting(NA_integer_, )
    test_subsetting(, NA_integer_)
    test_subsetting(NA_integer_, NA_integer_)
    test_subsetting_error(NA_character_, )
    test_subsetting_error(, NA_character_)
    test_subsetting_error(NA_character_, NA_character_)
    test_subsetting(c(1, NA), )
    test_subsetting(, c(1, NA))
    test_subsetting(c(1, NA), c(1, NA))
    test_subsetting_error(c(-1, NA), )
    test_subsetting_error(, c(-1, NA))
    test_subsetting_error(c(-1, NA), c(-1, NA))
    test_subsetting(c(TRUE, NA), )
    test_subsetting(, c(TRUE, NA))
    test_subsetting(c(TRUE, NA), c(TRUE, NA))
    test_subsetting(c(FALSE, NA), )
    test_subsetting(, c(FALSE, NA))
    test_subsetting(c(FALSE, NA), c(FALSE, NA))
    test_subsetting_error(c(ROW_NAME_1, NA), )
    test_subsetting_error(, c(COL_NAME_1, NA))
    test_subsetting_error(c(ROW_NAME_1, NA), c(COL_NAME_1, NA))

})

test_that("multi indexing by zero works", {

    # Not implemented
    # test_subsetting_error(0, 0)

    test_subsetting(c(0, 1), )
    test_subsetting(, c(0, 1))
    test_subsetting(c(0, 1), c(0, 1))
    test_subsetting(c(0, -1), )
    test_subsetting(, c(0, -1))
    test_subsetting(c(0, -1), c(0, -1))
    test_subsetting_error(c(0, 1, -1), )
    test_subsetting_error(, c(0, 1, -1))
    test_subsetting_error(c(0, 1, -1), c(0, 1, -1))

})

test_that("n-dimensional indexing causes an error", {

    test_subsetting_error(1, 1, 1)

})
