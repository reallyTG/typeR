context("calceo")

# coeff <- c("(Intercept)" = -3.68, "Parsonnet" = 0.077)
# df <- data.frame(Parsonnet=c(0L, 0L, 50L, 50L),
#                  status = c(0, 1, 0, 1))

# test_that("Output results for different Parsonnet scores, Steiner (2014) p.234", {
#   expected_results <- list(-0.025, 0.975, -0.542, 0.458)
#   works <- lapply(seq_along(df$Parsonnet), function(i) round(calceo(df = df[i, ], coeff, yemp = TRUE)*-1, 3))
#   expect_equal(works, expected_results)
# })
#
# test_that("Output results for different Parsonnet scores with random outcome", {
#   set.seed(1234)
#   expected_results <- list(-0.025, -0.025, -0.542, 0.458)
#   works <- lapply(seq_along(df$Parsonnet), function(i) round(calceo(df = df[i, ], coeff, yemp = FALSE)*-1, 3))
#   expect_equal(works, expected_results)
#   set.seed(12)
#   expected_results <- list(-0.025, -0.025, 0.458, -0.542)
#   works <- lapply(seq_along(df$Parsonnet), function(i) round(calceo(df = df[i, ], coeff, yemp = FALSE)*-1, 3))
#   expect_equal(works, expected_results)
# })

# test_that("Different input values for df", {
#   dftest1 <- list(as.matrix(df), NULL)
#   lapply(dftest1, function(x) {
#     expect_error(do.call(x, calceo(df = x, coeff)),
#                  "Provide a dataframe for argument 'df'")})
#
#   dftest2 <- list(data.frame(0L, 1, 1), data.frame(0L), data.frame(NA))
#   lapply(dftest2, function(x) {
#     expect_error(do.call(x, calceo(df = x, coeff)),
#                  "Provide a dataframe with two columns for argument 'df'")})
#
#   dftest3 <- list(data.frame(0, 1), data.frame("0", 1), data.frame(NA, 1))
#   lapply(dftest3, function(x) {
#     expect_error(do.call(x, calceo(df = x, coeff)),
#                  "First column of dataframe must be of type integer")})
#
#   dftest4 <- list(data.frame(0L, 1L), data.frame(0L, "1L"), data.frame(0L, NA))
#   lapply(dftest4, function(x) {
#     expect_error(do.call(x, calceo(df = x, coeff)),
#                  "Second column of dataframe must be of type numeric")})
# })
#
# test_that("Different input values for coeff", {
#   coefftest <- list(coeff[1], rep(1, 3), NULL, NA)
#   lapply(coefftest, function(x) {
#     expect_error(do.call(x, calceo(df, coeff = x)),
#                  "Model coefficients 'coeff' must be a numeric vector with two elements")})
# })
#
# test_that("Different input values for yemp", {
#   expect_warning(calceo(df, coeff, yemp = as.character(TRUE)),
#                  "Argument 'yemp' must be logical using TRUE as default value")
#   expect_warning(calceo(df, coeff, yemp = as.numeric(TRUE)),
#                  "Argument 'yemp' must be logical using TRUE as default value")
#   expect_warning(calceo(df, coeff, yemp = NA),
#                  "Argument 'yemp' must be logical using TRUE as default value")
# })
