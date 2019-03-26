context("Metabolic equations")
library(PAutilities)

testthat::test_that("BMR equations behave as expected", {

  ## Variables
  Sex <- "M"
  Age <- get_age(
    as.Date("1990-01-01"), as.Date("2020-02-19"), "years"
  )
  Ht <- 2
  Wt <- 73

  ## Calculations
  test1 <- get_bmr(Sex, Ht, Wt, Age)

  test2 <- get_bmr(Sex, Ht, Wt, Age, RER = 0.84)

  test3 <- get_bmr(
    Sex, Ht, Wt, Age, RER = 0.865, MJ_conversion = c("all")
  )

  test4 <- get_bmr(
    Sex, Ht, Wt, Age, MJ_conversion = c("all")
  )

  test5 <- get_bmr(
    Sex, Ht, Wt, Age,
    method = "FAO", kcal_conversion = 4.86
  )

  test6 <- get_bmr(
    Sex, Ht, Wt, Age,
    method = "FAO", kcal_conversion = 5
  )

  test7 <- get_bmr(
    Sex, Ht, Wt, Age,
    method = "Schofield", RER = 0.8,
    kcal_table = "Peronnet"
  )

  test8 <- get_bmr(
    Sex, Ht, Wt, Age,
    equation = "ht_wt",
    method = "Schofield", RER = 0.8,
    kcal_table = "Peronnet"
  )

  ## Tests
  testthat::expect_equal_to_reference(
    list(
      test1, test2, test3, test4,
      test5, test6, test7, test8
    ),
    "BMR_calculations.rds"
  )

  testthat::expect_false(
    test5$basal_VO2_mlkgmin == test6$basal_VO2_mlkgmin
  )

})
