context("independence test")


x <- sample.int(20)
y <- sample.int(20)

test_that("catches wrong arguments", {
    # x and y
    expect_error(indep_test(x))
    expect_error(indep_test(cbind(x, y)))
    expect_error(indep_test(x, y[1:3]))
    expect_error(indep_test(x, list(1)))

    # method
    expect_silent(indep_test(x, y, method = "hoeff"))
    expect_error(indep_test(x, y, method = "a"))
    expect_error(indep_test(x, y, method = 2))

    # weights
    expect_error(indep_test(x, y, weights = 1:2))
    expect_error(indep_test(x, y, weights = "a"))
    expect_silent(indep_test(x, y, weights = seq_len(length(x))))

    # remove missing
    expect_error(indep_test(x, remove_missing = "a"))

    # alternative
    expect_silent(indep_test(x, y, alternative = "two-sided"))
    expect_silent(indep_test(x, y, alternative = "greater"))
    expect_silent(indep_test(x, y, alternative = "less"))
    expect_error(indep_test(x, y, alternative = "a"))
    expect_error(indep_test(x, y, alternative = 2))
})
