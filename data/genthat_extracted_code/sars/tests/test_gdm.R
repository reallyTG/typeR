context("gdm")
library(sars)

test_that("gdm functions return correct results", {
  galap$t <- c(5, 15, 7, 7, 5, 11, 13, 15, 6, 5, 8, 6, 14, 18, 6, 11)
  g <- gdm(galap, model = "loga", mod_sel = FALSE)
  expect_equal(round(as.vector(g$m$getPars()[2]), 2), 29.93)
  expect_is(g, "gdm")
})
