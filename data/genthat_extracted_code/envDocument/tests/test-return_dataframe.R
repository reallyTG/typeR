context("return_dataframe")

# make sure that env_doc returns a data frame; 
# need script = FALSE and git = FALSE to suppress errors

test_that("returns dataframe", {
  result <- env_doc(script = FALSE, git = FALSE)
  expect_s3_class(result, "data.frame")
})

test_that("gets system info", {
  result <- env_doc(script = FALSE, git = FALSE)
  expect_true(any(result$Section == "System"))
})

test_that("gets R version", {
  expect_equivalent(as.character(get_Rversion()$Value), 
                    R.version.string)
})
