context("make_order function")

l <- list(a = 1, b = 2, c = 3, d = 4)

test_that("Return class is factor", {
    expect_is(make_order(l, 0, "block"), "factor")
})

test_that("Return correct levels", {
    expect_equal(levels(make_order(l, 0, "block")), names(l))
})

test_that("Return correct lengths", {
    expect_length(make_order(l, 2, "block"), 8L)
    expect_length(make_order(l, 2, "inorder"), 8L)
    expect_length(make_order(l, 2, "random"), 8L)
    expect_length(make_order(l, 0, "block"), 0L)
    expect_length(make_order(l, 0, "inorder"), 0L)
    expect_length(make_order(l, 0, "random"), 0L)
})

test_that("Block order works correct", {
    f <- as.factor(rep(names(l), each = 2))
    expect_equal(make_order(l, 2, "block"), f)
})

test_that("Inorder order works correct", {
    f <- as.factor(rep(names(l), times = 2))
    expect_equal(make_order(l, 2, "inorder"), f)
})

test_that("Random order works correct", {
    set.seed(0)
    expect_false(identical(make_order(l, 2, "random"), make_order(l, 2, "random")))
})
