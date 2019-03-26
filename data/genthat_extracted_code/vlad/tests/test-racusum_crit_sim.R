context("racusum_crit_sim")
# R0 <- 1; RA <- 2
# library("spcadjust")
# data("cardiacsurgery")
# cardiacsurgery <- dplyr::mutate(cardiacsurgery, phase=factor(ifelse(date < 2*365, "I", "II")))
# S2 <- subset(cardiacsurgery, c(surgeon==2), c("phase", "Parsonnet", "status"))
# S2I <- subset(S2, c(phase=="I"), c("Parsonnet", "status"))
#
# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# coeff1 <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# L0 <- 1
#
# test_that("Input parameter of function", {
#   expect_error(racusum_crit_sim(L0 = 0, df1, coeff1),
#                "Given in-control ARL 'L0' must be a positive integer")
# })
#
# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, racusum_crit_sim(L0, df = x, coeff1)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, racusum_crit_sim(L0, df = x, coeff1)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, racusum_crit_sim(L0, df = x, coeff1)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, racusum_crit_sim(L0, df = x, coeff1)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for coeff", {
#    coefftest <- list(coeff1[1], rep(1, 3), NULL, NA)
#    lapply(coefftest, function(x) {
#      expect_error(do.call(x, racusum_crit_sim(L0, df1, coeff = x)),
#                   "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for R0", {
#   R0test <- list(-1, 0, "0", NA)
#   lapply(R0test, function(x) {
#     expect_error(do.call(x, racusum_crit_sim(L0, df1, coeff1, R0 = x)),
#                  "Odds ratio of death under the null hypotheses 'R0' must a positive numeric value")})
# })
#
# test_that("Different input values for RA", {
#   RAtest <- list(-1, 0, "0", NA)
#   lapply(RAtest, function(x) {
#     expect_error(do.call(x, racusum_crit_sim(L0, df1, coeff1, RA = x)),
#                  "Odds ratio of death under the alternative hypotheses 'RA' must a positive numeric value")})
# })
#
# test_that("Iterative search procedure I", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   expected_results <- 2.755999
#   coeff1 <- round(coef(glm(status~Parsonnet, data=S2I, family="binomial")), 3)
#   works <- racusum_crit_sim(L0=740, df=S2I, coeff=coeff1, verbose=TRUE)
#   expect_equal(works, expected_results, tolerance=0.3)
# })
#
# test_that("Iterative search procedure II", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(123)
#   expected_results <- 5.987258
#   coeff1 <- round(coef(glm(status~Parsonnet, data=S2I, family="binomial")), 3)
#   works <- racusum_crit_sim(L0=21000, df=S2I, coeff=coeff1, verbose=TRUE)
#   expect_equivalent(works, expected_results, tolerance=0.9)
# })
