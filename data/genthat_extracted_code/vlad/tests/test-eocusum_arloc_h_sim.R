context("eocusum_arloc_h_sim")

# library("spcadjust")
# data("cardiacsurgery")
# s5000 <- dplyr::sample_n(cardiacsurgery, size=5000, replace=TRUE)
#
# df1 <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L), status = c(0, 1, 0, 1))
# coeff1 <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# coeff2 <- coeff1
# k <- 0.01
# L0 <- 1
#
# test_that("Input parameter of function", {
#   expect_error(eocusum_arloc_h_sim(L0 = 0, k, df1, coeff1, coeff2),
#                "Given in-control ARL 'L0' must be a positive integer")
#   expect_error(eocusum_arloc_h_sim(L0, k = -1, df1, coeff1, coeff2),
#                "Reference value 'k' must be a positive numeric value")
# })
#
#  test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df1), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, eocusum_arloc_h_sim(L0, k, df = x, coeff1, coeff2)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, eocusum_arloc_h_sim(L0, k, df = x, coeff1, coeff2)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, eocusum_arloc_h_sim(L0, k, df = x, coeff1, coeff2)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, eocusum_arloc_h_sim(L0, k, df = x, coeff1, coeff2)),
#                  "Second column of dataframe must be of type numeric")})
#  })
#
# test_that("Different input values for coeff", {
#   coefftest <- list(coeff1[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, eocusum_arloc_h_sim(L0, k, df1, coeff = x, coeff2)),
#                  "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for coeff2", {
#   coefftest <- list(coeff2[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, eocusum_arloc_h_sim(L0, k, df1, coeff1, coeff2 = x)),
#                  "Model coefficients 'coeff2' must be a numeric vector with two elements")})
# })
#
# test_that("Input parameter QS", {
#   QStest <- list(-1, 0, "0", NA)
#   lapply(QStest, function(x) {
#   expect_error(do.call(x, eocusum_arloc_h_sim(L0, k,df1, coeff1, coeff2, QS = x)),
#                  "QS must a positive numeric value")})
#   expect_error(eocusum_arloc_h_sim(L0, k, df1, coeff1, coeff2, QS = 1/2, side = "low"),
#                "For detecting deterioration (side='low') QS must a positive numeric value >= 1",
#                fixed = TRUE)
#   expect_error(eocusum_arloc_h_sim(L0, k, df1, coeff1, coeff2, QS = 2, side = "up"),
#                "For detecting improvement (side='up') QS must a positive numeric value <= 1",
#                fixed = TRUE)
# })
#
#
# test_that("Iterative search procedure I", {
#   skip_on_cran()
#   skip_if(SKIP==TRUE, "skip this test now")
#   set.seed(1234)
#   expected_results <- 2.17
#   df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
#   df2 <- subset(s5000, select=c(Parsonnet, status))
#   coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
#   coeff2 <- round(coef(glm(status~Parsonnet, data=df2, family="binomial")), 3)
#   m <- 10^3
#   works <- eocusum_arloc_h_sim(L0=100, df=df1, k=0, m=m, side="low", coeff=coeff1, coeff2=coeff2, nc=1, verbose=TRUE)
#   expect_equal(works, expected_results, tolerance=0.2)
# })
