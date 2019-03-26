context("character")

test_that("Functions quotes() and unquote() are correct.", {
  expect_equal(quotes(), "\"\"")
  expect_equal(quotes(single = T), "\'\'")
  expect_equal(quotes(strings(x, y)), c("\"x\"", "\"y\""))
  expect_equal(quotes(c("x", "y")), c("\"x\"", "\"y\""))
  expect_equal(quotes(c("x", "y"), single = F), c("\"x\"", "\"y\""))
  expect_equal(quotes(c("x", "y"), single = T), c("\'x\'", "\'y\'"))
  expect_equal(unquote(), character(0))
  expect_equal(unquote(strings(x, y)), strings(x, y))
  expect_equal(
    unquote(deep = TRUE, x = quotes(quotes(quotes(c("x", "y")), single = T),
      single = F
    )), c("x", "y")
  )
  a <- c(
    "\"x\"", "\"y\"", "return(a)", "return(\"a\")",
    "\"x", "y\"", "\"x\"", "\"return(\"a\")\""
  )
  b <- c(
    "x", "y", "return(a)", "return(\"a\")",
    "x", "y", "x", "return(\"a\")"
  )
  expect_equal(unquote(a), b)
  x <- c("'x'", '"y"', "\"'x'\"", "'\"y\"'")
  y <- c("x", "y", "'x'", "\"y\"")
  z <- c("x", "y", "x", "y")
  expect_equal(unquote(x), y)
  expect_equal(unquote(x, deep = F), y)
  expect_equal(unquote(x, deep = T), z)
})

test_that("Function strings() is correct.", {
  expect_equal(character(0), strings())
  expect_equal("1", strings(1))
  expect_equal(
    "list(\"foo\", f(c(\"bar\", \"baz\")))",
    strings(list("foo", f(c("bar", "baz"))))
  )
})
