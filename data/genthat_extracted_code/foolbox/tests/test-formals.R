context("Manipulation of function parameters")

test_that("we can remove a variable from the formals of a function", {
    f <- function(x, y) y
    expect_equal(names(formals(f %>% remove_formal(x))), "y")
})
