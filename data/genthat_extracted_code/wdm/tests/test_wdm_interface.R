context("wdm interface")

x <- matrix(sample.int(20), 10, 2)
colnames(x) <- letters[1:2]

test_that("works with two vectors", {
    expect_equal(wdm(x[, 1], x[, 2]), cor(x[, 1], x[, 2]))
})

test_that("works with single matrix", {
    expect_equal(wdm(x), cor(x))
})

test_that("works with two matrices", {
    expect_equal(wdm(x, cbind(x, x)), cor(x, cbind(x, x)))
})

test_that("works with data frames", {
    x <- as.data.frame(x)
    expect_equal(wdm(x), cor(x))
    expect_equal(wdm(x, x), cor(x, x))
})

test_that("remove_missing handles NAs properly", {
    x[1, 1] <- NA
    expect_equal(wdm(x), cor(x, use = "pairwise"))
    expect_error(wdm(x, remove_missing = FALSE))

    x[1:9] <- NA
    expect_equal(wdm(x[, 1], x[, 2]), cor(x[, 1], x[, 2], use = "pairwise"))
})

test_that("catches wrong arguments", {
    # x and y
    expect_error(wdm(x[, 1]))
    expect_error(wdm(as.character(x)))
    expect_error(wdm(list(1)))
    expect_error(wdm(x, list(1)))
    expect_error(wdm(x[, 1], x[1:5, 2]))
    expect_silent(wdm(x, cbind(x, x)))

    # method
    expect_error(wdm(x, method = "a"))
    expect_silent(wdm(x, method = "hoeff"))
    expect_error(wdm(x, method = 2))

    # weights
    expect_error(wdm(x, weights = 1:2))
    expect_error(wdm(x, weights = "a"))
    expect_silent(wdm(x, weights = seq_len(nrow(x))))

    # remove missing
    expect_error(wdm(x, remove_missing = "a"))
})
