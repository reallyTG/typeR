context("meanR")

test_that('statistics', {

  expect_identical(length(reps), length(R))
  expect_identical(length(R), nrow(rs$CP))

  ## Try computation and check that all values are coherent
  expect_silent(MeanR <- meanR(data, fit, transforms, "loewe",
                               R, rs$CP, reps))

  expect_that(inherits(MeanR, "meanR"), is_true())
  expect_that(MeanR$FStat > 0, is_true())
  expect_that(MeanR$p.value >= 0, is_true())
  expect_that(MeanR$p.value <= 1, is_true())

  ## Try computation with random data
  reps <- sample(1:10, length(reps), replace = TRUE)
  R <- rnorm(length(reps))
  CP <- rWishart(1, length(reps), diag(1, length(reps)))[,,1]

  expect_silent(MeanR <- meanR(data, fit, transforms, "loewe",
                               R, CP, reps))
  expect_that(MeanR$FStat > 0, is_true())
  expect_that(MeanR$p.value >= 0, is_true())
  expect_that(MeanR$p.value <= 1, is_true())


})
