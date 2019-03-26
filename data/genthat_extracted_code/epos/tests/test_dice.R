library(epos)
context("test_dice")

test_that("Test dice if it calculates the correct dice coefficient", {
  expect_that(dice(1,3,4), equals(1-0.2857143))
})