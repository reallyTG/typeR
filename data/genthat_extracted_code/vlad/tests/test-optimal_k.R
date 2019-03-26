context("optimal_k")

# coeff <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# df <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L),
#                  status = c(0, 1, 0, 1))
# QA <- 2
#
# test_that("Output of optimal_k calculation", {
#   expected_results <- 0.1255
#   works <- round(optimal_k(QA = 2, df, coeff, FALSE), 4)
#   expect_equal(works, expected_results)
# })
#
# test_that("Output of optimal_k calculation", {
#   expected_results <- 0.079
#   QA <- 1/2
#   works <- round(optimal_k(QA, df, coeff, FALSE), 4)
#   expect_equal(works, expected_results)
# })
#
# test_that("Output of optimal_k calculation", {
#   expected_results <- 0.2213
#   works <- round(optimal_k(QA, df, coeff, TRUE), 4)
#   expect_equal(works, expected_results)
# })
#
# test_that("Output of optimal_k calculation", {
#   expected_results <- 0.1393
#   QA <- 1/2
#   works <- round(optimal_k(QA, df, coeff, TRUE), 4)
#   expect_equal(works, expected_results)
# })
#
# test_that("Different input values for coeff", {
#   coefftest <- list(coeff[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, optimal_k(QA, df, coeff = x, FALSE)),
#                  "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for QA", {
#   QAtest <- list(-1, NA, 0)
#   lapply(QAtest, function(x) {
#     expect_error(do.call(x, optimal_k(QA = QAtest, df, coeff, FALSE)),
#                  "QA must a positive numeric value")})
# })
#
# test_that("Different input values for yemp", {
#   expect_warning(optimal_k(QA, df, coeff, yemp = as.character(TRUE)),
#                  "Argument 'yemp' must be logical using TRUE as default value")
#   expect_warning(optimal_k(QA, df, coeff, yemp = as.numeric(TRUE)),
#                  "Argument 'yemp' must be logical using TRUE as default value")
#   expect_warning(optimal_k(QA, df, coeff, yemp = NA),
#                  "Argument 'yemp' must be logical using TRUE as default value")
# })
