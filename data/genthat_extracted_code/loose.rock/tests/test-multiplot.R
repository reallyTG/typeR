context("multiplot")

test_that("single multiplot", {
  expect_silent(multiplot(ggplot2::qplot(1:10, 11:20)))
  expect_silent(multiplot(ggplot2::qplot(1:10, 11:20), ggplot2::qplot(1:10, 20:11)))
  expect_silent(multiplot(ggplot2::qplot(1:10, 11:20), ggplot2::qplot(1:10, 20:11), ncol = 2))
  expect_silent(multiplot(plotlist = list(ggplot2::qplot(1:10, 11:20), ggplot2::qplot(1:10, 20:11)), ncol = 2))
  expect_silent(multiplot(plotlist = list(ggplot2::qplot(1:10, 11:20), ggplot2::qplot(1:10, 20:11)), ncol = 2, layout = as.matrix(c(2,1))))
})
