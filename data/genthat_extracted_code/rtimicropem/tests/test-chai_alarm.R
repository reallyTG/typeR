library("rtimicropem")
#################################################################################################
context("chai_alarm")
#################################################################################################
test_that("chai_alarm outputs a data table", {
  data(micropemChai)
  expect_that(chai_alarm(micropemChai), is_a("tbl_df"))
})

test_that("we get the right error messages", {
  data(micropemChai)
  micropemChai2 <- micropemChai$clone()
  micropemChai2$settings$nephelometer_slope <- 3
  micropemChai2$measures$flow[1] <- 100
  expect_equal(as.character(chai_alarm(micropemChai2)$alarm[1]),
               "Flow outside of normal range at least once")

  micropemChai2 <- micropemChai$clone()
  micropemChai2$settings$nephelometer_slope <- 300
  expect_equal(as.character(chai_alarm(micropemChai2)$alarm[1]),
               "Nephelometer slope is not 3")


  micropemChai2 <- micropemChai$clone()
  micropemChai2$settings$nephelometer_slope <- 3
  micropemChai2$measures$flow <- rep(0.5, length(micropemChai2$measures$flow))
  expect_equal(as.character(chai_alarm(micropemChai2)$alarm[1]),
               "All is good")

  micropemChai2 <- micropemChai$clone()
  micropemChai2$settings$nephelometer_slope <- 3
  micropemChai2$measures$flow <- rep(0.5, length(micropemChai2$measures$flow))
  micropemChai2$measures$rh_corrected_nephelometer <-
    rep(-1, length(micropemChai2$measures$rh_corrected_nephelometer))
  expect_equal(as.character(chai_alarm(micropemChai2)$alarm[2]),
               "Too many negative values")
})
