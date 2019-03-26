context("Capture unevaluated dots")

test_that("'dots' returns correct objects", {
    expect_is(dots(1, 2, 3), "list")
    expect_equal(dots(1, 2, {3}), list(1, 2, quote({3})))
    expect_equal(dots("a", "b", {"c"}), list("a", "b", quote({"c"})))
    expect_equal(dots(1:2, 1:3), list(quote(1:2), quote(1:3)))
    expect_equal(dots(a, b), list(as.symbol("a"), as.symbol("b")))
    expect_equal(dots(a = mean(1), b = mean(2)),
                 list(a = quote(mean(1)), b = quote(mean(2))))
})

test_that("'named_dots' returns correct names", {
    expect_named(named_dots(1, 2, a, b = 1:5, {3}),
                 c("1", "2", "a", "b", "{ 3 }"))
    expect_named(named_dots(NULL), "NULL")
    expect_named(named_dots({{NULL}}), "{ { NULL } }")
    expect_named(named_dots({NULL; NULL}), "{ NULL; NULL }")
    expect_named(named_dots(f <- function() { NULL }), "f <- function() { NULL }")
    expect_named(named_dots({f <- function() { NULL; NULL }}), "{ f <- function() { NULL; NULL } }")
})
