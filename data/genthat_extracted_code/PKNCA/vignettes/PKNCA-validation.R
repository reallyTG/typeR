## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo=TRUE,
                      fig.width=6,
                      fig.height=4)
library(PKNCA)
library(knitr)
library(testthat)
library(dplyr)

run_tests <- dir.exists(system.file(package="PKNCA", "tests/"))
testing_results <- "Tests were not run because tests are not installed."

## ----validation, include=FALSE, eval=run_tests---------------------------
#  testresult <- test_package(package="PKNCA")
#  test_log <- as.data.frame(testresult)
#  failed_tests <- sum(test_log$failed)
#  testing_results <-
#    if (failed_tests == 0) {
#      "All tests passed."
#    } else {
#      "Some tests failed (see below)."
#    }

## ----testing_log, results="asis", echo=FALSE, eval=run_tests-------------
#  cat("# Testing Log\n\n")
#  
#  all_contexts <- unique(test_log$context)
#  test_log_printing <-
#    test_log %>%
#    rename(`Testing Filename`=file,
#           `Test Description`=test,
#           `Number of Tests`=nb,
#           `Number of Failed Tests`=failed)
#  
#  for (current_context in all_contexts) {
#    current_log <-
#      test_log_printing[
#        test_log_printing$context %in% current_context,
#        setdiff(names(test_log_printing),
#                c("context", "skipped",
#                  "error", "warning",
#                  "user", "system", "real")),
#        drop=FALSE]
#    cat("## ", current_context, "\n\n")
#    print(kable(x=current_log,
#                row.names=FALSE))
#    cat("\n\n")
#  }

## ----session_info--------------------------------------------------------
Sys.Date()
sessionInfo()

