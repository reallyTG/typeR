library(provParseR)
library(testthat)

## Loading test data
test.data <- system.file("testdata", "prov2.json", package = "provParseR")
prov <- prov.parse(test.data)

context("Scripts access function")
scripts.df <- get.scripts(prov)
expect_match(class(scripts.df), "data.frame")
expect_equal (nrow(scripts.df), 5)

saved.scripts.df <- get.saved.scripts(prov)
expect_equal (nrow(saved.scripts.df), 5)
directory <- dirname (saved.scripts.df$script[1])
expect_equal (directory, 
    "/Users/blerner/Documents/Process/DataProvenance/github/RDataTracker/scriptTests/SourceFuncTest/prov_SourceFuncTest/scripts")
