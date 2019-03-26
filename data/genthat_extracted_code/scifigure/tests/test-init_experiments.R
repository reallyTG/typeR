context("Checking init_experiments")
names = c("Run_16_01", "Run_16_04", "Run_16_07",
          "Run_16_09", "Run_16_12")

testthat::test_that("more names than experiments", {
  testthat::expect_error({
    init_experiments(nexp = 2, exp_names = names)
  })
})
