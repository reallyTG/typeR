context("racusum_arl_mc")

# pmix <- data.frame(cbind(c(0.1, 0.5, 0.4), c(0.1, 0.12, 0.14), c(0.1, 0.12, 0.14)))
# RA <- 2
# RQ <- 1
# h <- 2.9
# scaling <- 600
# rounding <- "p"
# method <- "Toep"
#
# test_that("Different input values for pmix", {
#
#   pmix2 <- data.frame(cbind(c(0.2, 0.5, 0.4), c(0.1, 0.12, 0.14), c(0.1, 0.12, 0.14)))
#   expect_error(racusum_arl_mc(pmix = pmix2, RA, RQ, h),
#                "Probabilities in first column of matrix 'pmix' should add to 1")
# })
#
# test_that("Different input values for RA", {
#   RAtest <- list(-1, 0, "0", NA)
#   lapply(RAtest, function(x) {
#     expect_error(do.call(x, racusum_arl_mc(pmix, RQ, h, scaling, rounding, method, RA = x)),
#                  "Odds ratio of death under the alternative hypotheses 'RA' must a positive numeric value")})
# })
#
# test_that("Different input values for RQ", {
#   R0test <- list(-1, 0, "0", NA)
#   lapply(R0test, function(x) {
#     expect_error(do.call(x, racusum_arl_mc(pmix, RA, h, scaling, rounding, method, RQ = x)),
#                  "True performance of a surgeon 'RQ' must a positive numeric value")})
# })
#
# test_that("Input parameter for h", {
#   expect_error(racusum_arl_mc(pmix, RA, RQ, h = 0, scaling, rounding, method),
#                "Control limit 'h' must be a positive numeric value")
# })
#
# test_that("Different input values for scaling", {
#   scatest <- list(-1, 0, "0", NA)
#   lapply(scatest, function(x) {
#     expect_error(do.call(x, racusum_arl_mc(pmix, RA, RQ, h, rounding, method, scaling = x)),
#                  "Parameter 'scaling' must a positive integer value")})
# })
#
# test_that("Different Markov Chain algorithms, detecting deterioration", {
#   skip_on_cran()
#   skip_if(SKIP == TRUE, "skip this test now")
#   set.seed(1234)
#   data("cardiacsurgery", package = "spcadjust")
#   ## preprocess data to 30 day mortality and subset phase I (In-control) of surgeons 2
#   SALLI <- cardiacsurgery %>% rename(s = Parsonnet) %>%
#     mutate(y = ifelse(status == 1 & time <= 30, 1, 0),
#            phase = factor(ifelse(date < 2*365, "I", "II"))) %>%
#     filter(phase == "I") %>% select(s, y)
#   # set up parameters
#   mod1 <- glm(y ~ s, data = SALLI, family = "binomial")
#   s <- sort(unique(SALLI$s))
#   fi  <- as.numeric(table(SALLI$s)/length(SALLI$s))
#   pi <- predict(mod1, newdata = data.frame(s), type = "response")
#   pmix  <- data.frame(fi, pi, pi)
#   h <- 4.655
#   sca <- 600
#
#   ## simple rounding
#   expected_results <- racusum_arl_mc(pmix = pmix, h = h, RA = 2, RQ = 1, scaling = sca, rounding = "s", method = "Toep")
#   MCtest <- list(
#     racusum_arl_mc(pmix = pmix, h = h, RA = 2, RQ = 1, scaling = sca, rounding = "s", method = "ToepInv"),
#     racusum_arl_mc(pmix = pmix, h = h, RA = 2, RQ = 1, scaling = sca, rounding = "s", method = "BE")
#   )
#   lapply(MCtest, function(x) expect_equal(x, expected_results, tolerance = 10^-6) )
#
#   ## paired rounding
#   expected_results <- racusum_arl_mc(pmix = pmix, h = h, RA = 2, RQ = 1, scaling = sca, rounding = "p", method = "Toep")
#   MCtest <- list(
#     racusum_arl_mc(pmix = pmix, h = h, RA = 2, RQ = 1, scaling = sca, rounding = "p", method = "ToepInv"),
#     racusum_arl_mc(pmix = pmix, h = h, RA = 2, RQ = 1, scaling = sca, rounding = "p", method = "BE")
#   )
#   lapply(MCtest, function(x) expect_equal(x, expected_results, tolerance = 10^-6) )
# })
#
# test_that("Different Markov Chain algorithms, detecting improvement", {
#   skip_on_cran()
#   skip_if(SKIP == TRUE, "skip this test now")
#   set.seed(1234)
#   data("cardiacsurgery", package = "spcadjust")
#   ## preprocess data to 30 day mortality and subset phase I (In-control) of surgeons 2
#   SALLI <- cardiacsurgery %>% rename(s = Parsonnet) %>%
#     mutate(y = ifelse(status == 1 & time <= 30, 1, 0),
#            phase = factor(ifelse(date < 2*365, "I", "II"))) %>%
#     filter(phase == "I") %>% select(s, y)
#   # set up parameters
#   mod1 <- glm(y ~ s, data = SALLI, family = "binomial")
#   s <- sort(unique(SALLI$s))
#   fi  <- as.numeric(table(SALLI$s)/length(SALLI$s))
#   pi <- predict(mod1, newdata = data.frame(s), type = "response")
#   pmix  <- data.frame(fi, pi, pi)
#   h <- 4.655
#   sca <- 600
#
#   ## simple rounding
#   expected_results <- racusum_arl_mc(pmix = pmix, h = h, RA = 1/2, RQ = 1, scaling = sca, rounding = "s", method = "Toep")
#   MCtest <- list(
#     racusum_arl_mc(pmix = pmix, h = h, RA = 1/2, RQ = 1, scaling = sca, rounding = "s", method = "ToepInv"),
#     racusum_arl_mc(pmix = pmix, h = h, RA = 1/2, RQ = 1, scaling = sca, rounding = "s", method = "BE")
#   )
#   lapply(MCtest, function(x) expect_equal(x, expected_results, tolerance = 10^-6) )
#
#   ## paired rounding
#   expected_results <- racusum_arl_mc(pmix = pmix, h = h, RA = 1/2, RQ = 1, scaling = sca, rounding = "p", method = "Toep")
#   MCtest <- list(
#     racusum_arl_mc(pmix = pmix, h = h, RA = 1/2, RQ = 1, scaling = sca, rounding = "p", method = "ToepInv"),
#     racusum_arl_mc(pmix = pmix, h = h, RA = 1/2, RQ = 1, scaling = sca, rounding = "p", method = "BE")
#   )
#   lapply(MCtest, function(x) expect_equal(x, expected_results, tolerance = 10^-6) )
# })
