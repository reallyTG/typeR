context("MC")

test_that("MC extra indicators", {
  Real <-   c(0,1,0,1,0,1,1,0,1)
  Tested <- c(1,0,0,1,0,1,1,1,1)
  Confusion <- MC(Real,Tested,metrics=TRUE)

  expect_equal(Confusion[[2]]$Success_rate, 2/3)
  expect_equal(Confusion[[3]]$Sensitivity[1], 2/3)
  expect_equal(Confusion[[3]]$Prevalence[2], 2/3)
  expect_equal(Confusion[[3]]$Specificity[2], 2/3)
  expect_equal(Confusion[[3]]$Precision[1], 1/3)

})
