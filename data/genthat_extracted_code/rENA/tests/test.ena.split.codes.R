# suppressMessages(library(rENA, quietly = T, verbose = F))
# context("Split concatenated code column");
#
#
# test_that("Code column with character delimited codes", {
#   file <- system.file("extdata", "test-bad-code-col-2.csv", package="rENA");
#   split = ena.split.codes(file, split.columns="Codes");
#
#   testthat::expect_is(
#     label = "Split result is a data.frame",
#     object = split,
#     class = "data.frame"
#   );
#   testthat::expect_gt(
#     label = "Number of rows in returned data.frame is equal to that of original file",
#     object = length(colnames(split)),
#     expected = length(colnames(file))
#   );
# })
