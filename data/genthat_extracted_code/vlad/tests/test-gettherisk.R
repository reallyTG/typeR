context("gettherisk")

# coeff <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# parsonnetscore <- 0L
#
# test_that("Different Parsonnet scores, Steiner et al. (2000) p. 445", {
#   expect_equal(round(gettherisk(0L, coeff), 3), 0.025)
#   expect_equal(round(gettherisk(71L, coeff), 3), 0.86, tolerance = 0.03)
# })
#
# test_that("Different Parsonnet scores, Steiner (2014) p. 234", {
#   expect_equal(round(gettherisk(0L, coeff), 3), 0.025)
#   expect_equal(round(gettherisk(50L, coeff), 3), 0.542)
# })
#
# test_that("Different input values for coeff", {
#   coefftest <- list(coeff[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, gettherisk(parsonnetscore, coeff = x)),
#                  "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for parsonnetscore", {
#   parsonnetscoretest <- list(1, NA, NULL)
#   lapply(parsonnetscoretest, function(x) {
#     expect_error(do.call(x, gettherisk(parsonnetscore = x, coeff)),
#                  "Argument 'parsonnetscore' must be an integer value")})
# })
#
# test_that("Different Parsonnet scores, Rigdon and Fricker (2015) p. 221, 225", {
#   coeff <- c("(Intercept)" = -3.67, "Parsonnet" = 0.077)
#   expect_equal(round(gettherisk(19L, coeff), 5), 0.09912)
#   expect_equal(round(gettherisk(0L, coeff), 5), 0.02484)
# })
