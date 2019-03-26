context("benchmark function")

b <- benchmark(1 + 1, 2 + 2)

test_that("Return correct class", {
    expect_is(b, "benchmark")
    expect_is(b, "data.frame")
})

test_that("Returned object contains factor and numeric", {
    expect_is(b$expr, "factor")
    expect_is(b$time, "numeric")
    expect_equal(levels(b$expr), c("1 + 1", "2 + 2"))
})

test_that("Return correct names", {
    expect_named(b, c("expr", "time"))
})

test_that("Return correct dimensions", {
    expect_equal(dim(b), c(200L, 2L))
})

test_that("Return correct 'error' attribute", {
    a <- attr(b, "error")
    expect_false(is.null(a))
    expect_is(a, "numeric")
    expect_gte(a, 0)
})

test_that("Return correct 'precision' attribute", {
    a <- attr(b, "precision")
    expect_false(is.null(a))
    expect_is(a, "numeric")
    expect_gte(a, 0)
    expect_lte(a, 1)
})

test_that("Return correct 'times' attribute", {
    a <- attr(b, "times")
    expect_false(is.null(a))
    expect_is(a, "integer")
    expect_equal(a, 100L)
})

test_that("Return correct 'units' attribute", {
    a <- attr(b, "units")
    expect_is(a, "character")
    expect_equal(a, "s")
})

test_that("Return correct 'gc' attribute", {
    a <- benchmark(1 + 1, times = 1L, gcDuring = FALSE)
    b <- benchmark(1 + 1, times = 1L, gcDuring = TRUE)
    expect_equal(attr(a, "gc"), FALSE)
    expect_equal(attr(b, "gc"), TRUE)
})

test_that("Return correct 'order' attribute", {
    a <- benchmark(1 + 1, times = 1L, order = "random")
    b <- benchmark(1 + 1, times = 1L, order = "block")
    c <- benchmark(1 + 1, times = 1L, order = "inorder")
    expect_equal(attr(a, "order"), "random")
    expect_equal(attr(b, "order"), "block")
    expect_equal(attr(c, "order"), "inorder")
})

test_that("Empty call list throws an error", {
    expect_error(benchmark(), "No expressions to benchmark")
})
