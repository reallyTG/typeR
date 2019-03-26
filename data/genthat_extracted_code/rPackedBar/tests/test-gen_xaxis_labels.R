context("gen xlabs")

test_that("xlabs class", {
  row_sums = runif(4,.2,.3)
  total_x  = runif(1, 1, 10000)

  xlabs = gen_xaxis_labels(row_sums, total_x)

  expect_identical(class(xlabs), "list")
  expect_identical(class(xlabs$tick_text), "character")
  expect_identical(class(xlabs$tick_breaks), "numeric")
})

test_that("xlabs vals", {
  row_sums = c(0.2229, 0.2315, 0.2005, 0.2199)
  total_x = 10000

  xlabs = gen_xaxis_labels(row_sums, total_x)

  expect_identical(xlabs,
                   list(tick_text = c("0", "500", "1000", "1500", "2000", "2500"),
                        tick_breaks = c(0, 0.05, 0.1, 0.15, 0.2, 0.25)))
})

test_that("bad input", {
  row_sums = runif(4, .2, .3)
  total_x  = runif(1, 1, 10000)

  expect_error(gen_xaxis_labels("row_sums", total_x))
  expect_error(gen_xaxis_labels(row_sums, "total_x"))
  expect_error(gen_xaxis_labels(row_sums, c(10,100)))
})
