context("bcusum_crit_sim")

# library("spcadjust")
# data("cardiacsurgery")
# cardiacsurgery <- dplyr::mutate(cardiacsurgery, phase=factor(ifelse(date < 2*365, "I", "II")))
# S2 <- subset(cardiacsurgery, c(surgeon==2), c("phase", "Parsonnet", "status"))
# S2I <- subset(S2, c(phase=="I"), c("Parsonnet", "status"))
#
#
# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# coeff1 <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# L0 <- 1
#
# test_that("Input parameter of function", {
#   expect_error(bcusum_crit_sim(L0 = 0, df1),
#                "Given in-control ARL 'L0' must be a positive integer")
# })
#
# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, bcusum_crit_sim(L0, df = x)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, bcusum_crit_sim(L0, df = x)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, bcusum_crit_sim(L0, df = x)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, bcusum_crit_sim(L0, df = x)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for R0", {
#   R0test <- list(-1, 0, "0", NA)
#   lapply(R0test, function(x) {
#     expect_error(do.call(x, bcusum_crit_sim(L0, df1, R0 = x)),
#                  "Odds ratio of death under the null hypotheses 'R0' must a positive numeric value")})
# })
#
# test_that("Different input values for RA", {
#   RAtest <- list(-1, 0, "0", NA)
#   lapply(RAtest, function(x) {
#     expect_error(do.call(x, bcusum_crit_sim(L0, df1, RA = x)),
#                  "Odds ratio of death under the alternative hypotheses 'RA' must a positive numeric value")})
# })
#
# test_that("Iterative search procedure I (deteroration)", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   E0 <- mean(S2I$status)
#   R0 <- E0
#   RA <- 0.8*E0
#   works <- bcusum_crit_sim(L0=740, df=S2I, m=10^2, nc=1, R0=R0, RA=RA, verbose=TRUE)
#   expected_results <- 1.295
#   expect_equal(works, expected_results, tolerance=0.1)
# })
