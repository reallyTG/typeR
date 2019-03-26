context("Graphics_evaluation")

test_that("Parameter_for_control",{
  NT_s = plotNT.sup(p0=0.5, M=100, q=0.5, alpha1=0.01)
  expect_equal(dim(NT_s), c(50, 4))
})
