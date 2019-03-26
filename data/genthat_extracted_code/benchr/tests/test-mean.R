context("Mean method")

b <- benchmark(1 + 1, 2 + 2)
m <- mean(b)

test_that("Return correct class", {
    expect_is(m, "data.frame")
    expect_is(m, "summaryBenchmark")
})

test_that("Return correct dimensions", {
    expect_equal(dim(m), c(2L, 7L))
})

test_that("Return correct column names", {
    expect_named(m, c("expr", "n.eval", "mean", "trimmed", "lw.ci", "up.ci", "relative"))
})

test_that("Returned object contains factor and numeric", {
    expect_is(m$expr, "factor")
    expect_true(all(sapply(m[-1], is.numeric)))
    expect_equal(levels(m$expr), c("1 + 1", "2 + 2"))
})

test_that("Returned stats is correct", {
    fun <- function(x, FUN, ...) sapply(split(x$time, x$expr), FUN, ...)
    expect_equivalent(m$mean, fun(b, mean, na.rm = TRUE))
    expect_equivalent(m$trimmed, fun(b, mean, na.rm = TRUE, trim = 0.05))
    conf.ints <- unlist(fun(b, wilcox.test, conf.int = TRUE, conf.level = 0.95)[c(8, 17)])
    expect_equivalent(m$lw.ci, conf.ints[c(1, 3)])
    expect_equivalent(m$up.ci, conf.ints[c(2, 4)])
})

test_that("Return correct 'n.eval'", {
    expect_equal(sum(!is.na(b$time)), sum(m$n.eval))
})

test_that("'relative' param works correct", {
    expect_error(mean(b, relative = "z"))
    expect_error(mean(b, relative = 100))
    expect_null(mean(benchmark(1 + 1))$relative)
    expect_null(mean(b, relative = NULL)$relative)
    m1 <- mean(b, relative = "mean")
    m2 <- mean(b, relative = "trimmed", trim = 0.05)
    expect_equal(m1$relative, signif(m1$mean / min(m1$mean), 3))
    expect_equal(m2$relative, signif(m2$trimmed / min(m2$trimmed), 3))
    expect_equal(mean(b, relative = "mean"), mean(b, relative = 3))
})

test_that("Calculate CI only if times >= 5", {
    m1 <- mean(benchmark(1 + 1, times = 5))
    m2 <- mean(benchmark(1 + 1, times = 1))
    expect_is(m1$lw.ci, "numeric")
    expect_is(m1$up.ci, "numeric")
    expect_null(m2$lw.ci)
    expect_null(m2$up.ci)
})

