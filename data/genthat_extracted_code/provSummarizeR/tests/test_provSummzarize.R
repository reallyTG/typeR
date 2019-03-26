library(provSummarizeR)
library(testthat)

## Loading test data
test.data <- system.file("testdata", "prov.json", package = "provSummarizeR", mustWork=TRUE)

# Test prov.summarize.file
summary <- capture.output (prov.summarize.file(test.data, save = FALSE, create.zip = FALSE))
expect_equal(length(summary), 41)

# Test prov.summarize.run
test.script <- system.file("testscript", "warnings.R", package = "provSummarizeR", mustWork=TRUE)
summary <- capture.output (prov.summarize.run(test.script))
expect_equal(length(summary), 45)

# Test console session
test.data <- system.file("testdata", "console.json", package = "provSummarizeR", mustWork=TRUE)
summary <- capture.output (prov.summarize.file(test.data, save = FALSE, create.zip = FALSE))
expect_equal(length(summary), 22)
