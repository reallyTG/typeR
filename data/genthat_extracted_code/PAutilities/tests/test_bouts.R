context("MVPA bout analyses")
library(PAutilities)

testthat::test_that("bout_mvpa produces expected output", {

  data(ex_data, package = "PAutilities")
  ex_data$DateTime <- as.POSIXct(ex_data$DateTime, "UTC")


  test1 <- lapply(
    split(ex_data, strftime(ex_data$DateTime, "%Y-%m-%d", "UTC")),
    function(x) {
      bout_mvpa(x$METs, "METs", timestamps = x$DateTime)
      }
  )

  testthat::expect_equal_to_reference(
    test1, "bout_mvpa_all.rds"
  )

  test2 <- lapply(
    split(ex_data, strftime(ex_data$DateTime, "%Y-%m-%d", "UTC")),
    function(x) {
      bout_mvpa(
        x$METs,
        "METs",
        timestamps = x$DateTime,
        output_var = "is_MVPA"
      )
    }
  )

  testthat::expect_equal_to_reference(
    test2, "bout_mvpa_is_mvpa.rds"
  )

  test3 <- lapply(
    split(ex_data, strftime(ex_data$DateTime, "%Y-%m-%d", "UTC")),
    function(x) {
      bout_mvpa(
        x$METs,
        "METs",
        timestamps = x$DateTime,
        output_var = "bout_tracker"
      )
    }
  )

  testthat::expect_equal_to_reference(
    test3, "bout_mvpa_bout_tracker.rds"
  )

})
