
subset_results <- function(results, file, test) {
  subset <- purrr::keep(results, function(result) {
    result$file == file && result$test == test
  })
  subset[[1]]$results
}


mock_pkg_dir <- create_mock_pkg()
mock_test_dir <- file.path(mock_pkg_dir, "tests", "testthat")

vars <- c(
  VDIFFR_LOG_PATH = file.path(mock_pkg_dir, "tests", "vdiffr.Rout.fail"),
  NOT_CRAN = "true"
)
withr::with_envvar(vars, {
  test_results <- testthat::test_dir(mock_test_dir, reporter = "silent")
})

mock_cases_outputs <- purrr::quietly(purrr::safely(collect_cases))(mock_pkg_dir)

quietly_out <- mock_cases_outputs$result
if (inherits(quietly_out$error, "condition")) {
  cat("While collecting testing cases:\n")
  stop(quietly_out$error)
}

log_path <- file.path(mock_pkg_dir, "tests", "vdiffr.Rout.fail")
if (file.exists(log_path)) {
  copied <- file.copy(log_path, "../mock.Rout.fail", overwrite = TRUE)
  if (!copied) {
    warning("Failed to copy mock package log")
  }
}

mock_cases <- quietly_out$result
validate_cases(mock_cases)
