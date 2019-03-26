context("racusum_scores")

# test_that("patient Cusum values with different odds ratios, see Rigdon and Fricker p. 225, 226", {
#   coeff <- c("(Intercept)" = -3.67, "Parsonnet" = 0.077)
#   expected_results <- list(s1=0, s1l=0.05083)
#   wt1 <- round(llr_score(df = data.frame(19L, 0), coeff = coeff, R0 = 1, RA = 2), 4)
#   wt2 <- round(llr_score(df = data.frame(19L, 0), coeff = coeff, R0 = 1, RA = 1/2), 5)
#   works <- racusum_scores(wt1 = wt1, wt2 = wt2)
#   expect_equal(works, expected_results)
# })
