context("Strip comments")

test_that("Strip comments examples", {
  some_lines <- c("Text. % A comment", "20\\% of comments are % useful")
  expect_equal(strip_comments(some_lines), c("Text. %", "20\\% of comments are %"))
  expect_equal(strip_comments(some_lines, retain.percent.symbol = FALSE),
               c("Text. ", "20\\% of comments are "))
})
