context("racusum_adoc_sim")

# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# coeff1 <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# coeff2 <- coeff1
# r <- 1
# h <- 1
#
# library("spcadjust")
# data("cardiacsurgery")
# df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
#
# test_that("Input parameter of function", {
#   expect_error(racusum_adoc_sim(r = 0, coeff1, coeff2, h, df1),
#                "Number of simulation runs 'r' must be a positive integer")
#   expect_error(racusum_adoc_sim(r, coeff1, coeff2, h = 0, df1),
#                "Control limit 'h' must be a positive numeric value")
# })
#
# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df = x)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df = x)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df = x)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df = x)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for coeff", {
#   coefftest <- list(coeff1[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff = x, coeff2, h, df1)),
#                  "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for coeff2", {
#   coefftest <- list(coeff1[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2 = x, h, df1)),
#                  "Model coefficients 'coeff2' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for R0", {
#   R0test <- list(-1, 0, "0", NA)
#   lapply(R0test, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df1, R0 = x)),
#                  "Odds ratio of death under the null hypotheses 'R0' must a positive numeric value")})
# })
#
# test_that("Different input values for RA", {
#   RAtest <- list(-1, 0, "0", NA)
#   lapply(RAtest, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df1, RA = x)),
#                  "Odds ratio of death under the alternative hypotheses 'RA' must a positive numeric value")})
# })
#
# test_that("Different input values for RQ", {
#   RQtest <- list(-1, 0, "0", NA)
#   lapply(RQtest, function(x) {
#     expect_error(do.call(x, racusum_adoc_sim(r, coeff1, coeff2, h, df1, RQ = x)),
#                  "RQ must a positive numeric value")})
# })
#
# test_that("Testing calculation of average delay (conditional)", {
#   skip_on_cran()
#   set.seed(1234)
#   skip_if(SKIP==TRUE, "skip this test now")
#   expected_results <- 60.22
#   coeff1 <- round(coef(glm(status ~ Parsonnet, data=df1, family="binomial")), 3)
#   works <- mean(do.call(c, parallel::mclapply(1:10^3, racusum_adoc_sim, RQ=2, h=2.0353, df=df1, m=100,
#                                             coeff=coeff1, coeff2=coeff1,
#                                             mc.cores=1) ))
#   expect_equal(works, expected_results, tolerance=2)
# })
#
# test_that("Testing calculation of average delay (cyclical)", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   expected_results <- 61.185
#   coeff1 <- round(coef(glm(status ~ Parsonnet, data=df1, family="binomial")), 3)
#   works <- mean(do.call(c, parallel::mclapply(1:10^3, racusum_adoc_sim, RQ=2, h=2.0353, df=df1, m=100,
#                                               coeff=coeff1, coeff2=coeff1,
#                                               mc.cores=1, type="cycl") ))
#   expect_equal(works, expected_results, tolerance=2)
# })
