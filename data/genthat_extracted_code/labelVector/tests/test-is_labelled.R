context("is.labelled.R")

x <- 1:10
x <- set_label(x, "A label")

test_that(
  "return TRUE when labelled",
  {
    expect_true(is.labelled(x))
  }
)

test_that(
  "return FALSE when not labelled",
  {
    expect_false(is.labelled(1:3))
  }
)

test_that(
  "cast an error if x is not atomic",
  {
    expect_error(is.labelled(mtcars))
  }
)