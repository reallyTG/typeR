context("test get_signif_code")

x <- tibble::tibble(p_val = list("test", NA, 0.025,
  0.009, Inf))
x$code <- get_signif_code(x$p_val)

test_that("test generated vector", {
  expect_is(x$code, "character")
  expect_equal(x$code, c("", "", "*", "**", " "))
})

