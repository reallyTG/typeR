context("gdd")
expect_numeric <- function(x) expect_is(x, "numeric")

test_that("gdd works", {
  df <- data.frame(tmax = runif(100, 6, 10), tmin = runif(100, 4, 6))
  results <- gdd(df$tmax, df$tmin, tbase = 5, tbase_max = 30)
  expect_numeric(results)
})
