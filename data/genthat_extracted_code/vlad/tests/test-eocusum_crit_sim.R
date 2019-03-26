context("eocusum_crit_sim")
#
# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# coeff1 <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# k <- 0.01
# L0 <- 1
#
# library("spcadjust")
# data("cardiacsurgery")
#
# test_that("Input parameter of function", {
#   expect_error(eocusum_crit_sim(L0 = 0, k, df1, coeff1),
#                "Given in-control ARL 'L0' must be a positive integer")
#   expect_error(eocusum_crit_sim(L0, k = -1, df1, coeff1),
#                "Reference value 'k' must be a positive numeric value")
# })
#
# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, eocusum_crit_sim(L0, k, df = x, coeff1)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, eocusum_crit_sim(L0, k, df = x, coeff1)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, eocusum_crit_sim(L0, k, df = x, coeff1)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, eocusum_crit_sim(L0, k, df = x, coeff1)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for coeff", {
#    coefftest <- list(coeff1[1], rep(1, 3), NULL, NA)
#    lapply(coefftest, function(x) {
#      expect_error(do.call(x, eocusum_crit_sim(L0, k, df1, coeff = x)),
#                   "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Iterative search procedure I (deteroration)", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
#   coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
#   m <- 10^3
#   QA <- 2
#   kopt <- optimal_k(QA=QA, df=df1, coeff=coeff1)
#   works <- eocusum_crit_sim(L0=370, df=df1, k=kopt, m=m, coeff=coeff1, side="low", verbose=TRUE)
#   expected_results <- 2.712
#   expect_equal(works, expected_results, tolerance=0.3)
# })
#
# test_that("Iterative search procedure II (improvement)", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
#   coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
#   m <- 10^2
#   QA <- 1/2
#   kopt <- optimal_k(QA=QA, df=df1, coeff=coeff1)
#   works <- eocusum_crit_sim(L0=370, df=df1, k=kopt, m=m, coeff=coeff1, side="up", verbose=TRUE)
#   expected_results <- 2.404999
#   expect_equal(works, expected_results, tolerance=0.3)
# })
