context("racusum_arl_h_sim")

# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# coeff1 <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# coeff2 <- coeff1
# L0 <- 1
#
# test_that("Input parameter of function", {
#   expect_error(racusum_arloc_h_sim(L0 = 0, df1, coeff1, coeff2),
#                "Given in-control ARL 'L0' must be a positive integer")
# })
#
# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df = x, coeff1, coeff2)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df = x, coeff1, coeff2)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df = x, coeff1, coeff2)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df = x, coeff1, coeff2)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for coeff", {
#    coefftest <- list(coeff1[1], rep(1, 3), NULL, NA)
#    lapply(coefftest, function(x) {
#      expect_error(do.call(x, racusum_arloc_h_sim(L0, df1, coeff = x, coeff2)),
#                   "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for coeff2", {
#   coeff2test <- list(coeff2[1], rep(1, 3), NULL, NA)
#   lapply(coeff2test, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df1, coeff1, coeff2 = x)),
#                  "Model coefficients 'coeff2' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for R0", {
#   R0test <- list(-1, 0, "0", NA)
#   lapply(R0test, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df1, coeff1, coeff2, R0 = x)),
#                  "Odds ratio of death under the null hypotheses 'R0' must a positive numeric value")})
# })
#
# test_that("Different input values for RA", {
#   RAtest <- list(-1, 0, "0", NA)
#   lapply(RAtest, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df1, coeff1, coeff2, RA = x)),
#                  "Odds ratio of death under the alternative hypotheses 'RA' must a positive numeric value")})
# })
#
# test_that("Different input values for RQ", {
#   RQtest <- list(-1, 0, "0", NA)
#   lapply(RQtest, function(x) {
#     expect_error(do.call(x, racusum_arloc_h_sim(L0, df1, coeff1, coeff2, RQ = x)),
#                  "RQ must a positive numeric value")})
# })
#
# test_that("Iterative search procedure I", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   expected_results <- 2.010269
#   R0 <- 1; RA <- 2
#   library("spcadjust")
#   data("cardiacsurgery")
#   s5000 <- dplyr::sample_n(cardiacsurgery, size=5000, replace=TRUE)
#   df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
#   df2 <- subset(s5000, select=c(Parsonnet, status))
#   coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
#   coeff2 <- round(coef(glm(status~Parsonnet, data=df2, family="binomial")), 3)
#   works <- racusum_arloc_h_sim(L0=370, df=df1, coeff=coeff1, coeff2=coeff2, nc=1, verbose=TRUE)
#   expect_equal(works, expected_results, tolerance=0.3)
# })
