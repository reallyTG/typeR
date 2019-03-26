context("Summary method")

b <- benchmark(1 + 1, 2 + 2)
s <- summary(b)

test_that("Return correct class", {
    expect_is(s, "data.frame")
    expect_is(s, "summaryBenchmark")
})

test_that("Return correct dimensions", {
    expect_equal(dim(s), c(2L, 10L))
})

test_that("Return correct column names", {
    expect_named(s, c("expr", "n.eval", "min", "lw.qu", "median", "mean", "up.qu", "max", "total", "relative"))
})

test_that("Returned object contains factor and numeric", {
    expect_is(s$expr, "factor")
    expect_true(all(sapply(s[-1], is.numeric)))
    expect_equal(levels(s$expr), c("1 + 1", "2 + 2"))
})

test_that("Returned stats is correct", {
    fun <- function(x, FUN, ...) sapply(split(x$time, x$expr), FUN, ...)
    expect_equivalent(s$min, fun(b, min, na.rm = TRUE))
    expect_equivalent(s$max, fun(b, max, na.rm = TRUE))
    expect_equivalent(s$mean, fun(b, mean, na.rm = TRUE))
    expect_equivalent(s$median, fun(b, median, na.rm = TRUE))
    expect_equivalent(s$total, fun(b, sum, na.rm = TRUE))
    expect_equivalent(s$lw.qu, fun(b, quantile, na.rm = TRUE, prob = 0.25))
    expect_equivalent(s$up.qu, fun(b, quantile, na.rm = TRUE, prob = 0.75))
})

test_that("Return correct 'n.eval'", {
    expect_equal(sum(!is.na(b$time)), sum(s$n.eval))
})

test_that("'relative' param throws erorr with a multiple column names", {
    expect_error(print(b, relative = c("min", "max")))
})

test_that("'relative' param throws erorr with a wrong column name", {
    expect_error(sary(b, relative = "z"))
})

test_that("'relative' param works correct", {
    expect_error(summary(b, relative = "z"))
    expect_error(summary(b, relative = 100))
    expect_null(summary(benchmark(1 + 1))$relative)
    expect_null(summary(b, relative = NULL)$relative)
    s1 <- summary(b, relative = "median")
    s2 <- summary(b, relative = "mean")
    expect_equal(s1$relative, signif(s1$median / min(s1$median), 3))
    expect_equal(s2$relative, signif(s2$mean / min(s2$mean), 3))
    expect_equal(summary(b, relative = "min"), summary(b, relative = 3))
})
