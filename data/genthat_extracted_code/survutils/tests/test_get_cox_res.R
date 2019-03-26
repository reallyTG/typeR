context("Cox regression")

test_that("get_cox_res correctly checks inputs", {
  # Test the swapping of endpoint and endpoint code variables
  expect_error(
    get_cox_res(
      survival::colon, 
      endpoint = "status", endpoint.code = "time", 
      features = "age"
    )
  )

  # Pass in erronous `broom.fun` option via positional arguments
  expect_error(
    get_cox_res(colon, "time", "status", "age", "rx", "non_broom.fun_opt")
  )
})

test_that("get_cox_res runs univariate Cox regression on a single feature", {
  endpoint <- "time"
  endpoint.code <- "status"
  features <- "age"

  expected_out_df <- 
    structure(
      list(
        term = "age", 
        estimate = 0.997558880035054, 
        std.error = 0.00279486462785936,
        statistic = -0.874498296537251, 
        p.value = 0.381846947490051, 
        conf.low = 0.992109357489558, 
        conf.high = 1.003038336071,
        test_type = "unicox"
      ), 
    .Names = 
      c(
        "term", "estimate", "std.error", "statistic", "p.value", "conf.low", 
        "conf.high", "test_type"
      ), 
    class = c("tbl_df", "tbl", "data.frame"), 
    row.names = c(NA, -1L))

  out_df <- get_cox_res(survival::colon, endpoint, endpoint.code, features)

  # Comparing the tibbles does not work
  # See https://stackoverflow.com/questions/37738318/how-to-set-tolerance-of-expect-equal-in-testthat-when-comparing-data-frames
  expect_equal(
    as.data.frame(out_df), 
    as.data.frame(expected_out_df),
    tolerance = 0.0001
  )
})
