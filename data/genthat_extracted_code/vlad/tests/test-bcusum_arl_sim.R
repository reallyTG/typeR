context("bcusum_arl_sim")

# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# r <- 1
# h <- 1
#
# test_that("Input parameter of function", {
#   expect_error(bcusum_arl_sim(r = 0, h, df1),
#                "Number of simulation runs 'r' must be a positive integer")
#   expect_error(bcusum_arl_sim(r, h = 0, df1),
#                "Control limit 'h' must be a positive numeric value")
# })
#
# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, bcusum_arl_sim(r, h, df = x)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, bcusum_arl_sim(r, h, df = x)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, bcusum_arl_sim(r, h, df = x)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, bcusum_arl_sim(r, h, df = x)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for R0", {
#   R0test <- list(-1, 0, "0", NA)
#   lapply(R0test, function(x) {
#     expect_error(do.call(x, bcusum_arl_sim(r, h, df1, R0 = x)),
#                  "Odds ratio of death under the null hypotheses 'R0' must a positive numeric value")})
# })
#
# test_that("Different input values for RA", {
#   RAtest <- list(-1, 0, "0", NA)
#   lapply(RAtest, function(x) {
#     expect_error(do.call(x, bcusum_arl_sim(r, h, df1, RA = x)),
#                  "Odds ratio of death under the alternative hypotheses 'RA' must a positive numeric value")})
# })
