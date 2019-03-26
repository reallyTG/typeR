context("Examples from HPS (2012,2013)")

data(Lambert)

test_that("Example 1 from HPS 2012", {
  
  ES_L <- with(Lambert, effect_size_ABk(outcome, treatment, case, phase, time))
  expect_equal(23, ES_L$M_dot)
  expect_equal(-5.457995, round(ES_L$D_bar,6))
  expect_equal(4.673913, round(ES_L$S_sq, 6))
  expect_equal(-2.524601, round(ES_L$delta_hat_unadj, 6))
  expect_equal(0.224680, round(ES_L$phi, 6))
  expect_equal(4.534312, round(ES_L$sigma_sq_w, 6))
  expect_equal(0.029868, round(ES_L$rho, 6))
  expect_equal(0.144926, round(ES_L$theta, 6))
  expect_equal(164.492271, round(ES_L$nu, 6))
  expect_equal(-2.513073, round(ES_L$delta_hat, 6))
  expect_equal(0.04054616, round(ES_L$V_delta_hat, 8))
  
})

data(Anglesea)

test_that("Example 2 from HPS 2012", {
  
  ES_A <- with(Anglesea, effect_size_ABk(outcome, condition, case, phase, session))
  expect_equal(13, ES_A$M_dot)
  expect_equal(86.870476, round(ES_A$D_bar,6))
  expect_equal(2347.845708, round(ES_A$S_sq, 6))
  expect_equal(1.792823, round(ES_A$delta_hat_unadj, 6))
  expect_equal(0.175859, round(ES_A$phi, 6))
  expect_equal(198.369968, round(ES_A$sigma_sq_w, 6))
  expect_equal(0.915510, round(ES_A$rho, 6))
  expect_equal(0.091347, round(ES_A$theta, 6))
  expect_equal(2.340135, round(ES_A$nu, 6))
  expect_equal(1.149507, round(ES_A$delta_hat, 6))
  expect_equal(2.43956417, round(ES_A$V_delta_hat, 8))
  
})

data(Saddler)

test_that("Example 1 from HPS 2013", {
  
  ES_S1 <- with(subset(Saddler, measure=="writing quality"), 
                effect_size_MB(outcome, treatment, case, time))
  expect_equal(41, ES_S1$g_dotdot)
  expect_equal(13, ES_S1$K)
  expect_equal(2.097222, round(ES_S1$D_bar,6))
  expect_equal(0.952381, round(ES_S1$S_sq, 6))
  expect_equal(2.149013, round(ES_S1$delta_hat_unadj, 6))
  expect_equal(0.099650, round(ES_S1$phi, 6))
  expect_equal(0.349322, round(ES_S1$sigma_sq_w, 6))
  expect_equal(0.633212, round(ES_S1$rho, 6))
  expect_equal(0.200641, round(ES_S1$theta, 6))
  expect_equal(8.918146, round(ES_S1$nu, 6))
  expect_equal(1.963073, round(ES_S1$delta_hat, 6))
  expect_equal(0.33491289, round(ES_S1$V_delta_hat, 8))
  
  ES_S2 <- with(subset(Saddler, measure=="T-unit length"), 
                effect_size_MB(outcome, treatment, case, time))
  expect_equal(0.785400, round(ES_S2$delta_hat, 6))
  expect_equal(0.08023320, round(ES_S2$V_delta_hat, 8))
  
  ES_S3 <- with(subset(Saddler, measure=="number of constructions"), 
                effect_size_MB(outcome, treatment, case, time))
  expect_equal(0.747554, round(ES_S3$delta_hat, 6))
  expect_equal(0.07847359, round(ES_S3$V_delta_hat, 8))
  
})

data(Laski)

test_that("Example 2 from HPS 2013", {
  
  ES_Laski <- with(Laski, effect_size_MB(outcome, treatment, case, time))
  expect_equal(128, ES_Laski$g_dotdot)
  expect_equal(27, ES_Laski$K)
  expect_equal(31.822475, round(ES_Laski$D_bar,6))
  expect_equal(465.815861, round(ES_Laski$S_sq, 6))
  expect_equal(1.474439, round(ES_Laski$delta_hat_unadj, 6))
  expect_equal(0.016526, round(ES_Laski$phi, 6))
  expect_equal(142.555268, round(ES_Laski$sigma_sq_w, 6))
  expect_equal(0.693966, round(ES_Laski$rho, 6))
  expect_equal(0.102497, round(ES_Laski$theta, 6))
  expect_equal(13.100415, round(ES_Laski$nu, 6))
  expect_equal(1.388385, round(ES_Laski$delta_hat, 6))
  expect_equal(0.10050132, round(ES_Laski$V_delta_hat, 8))
  
})

data(Thorne)

test_that("Order doesn't matter for ABk designs", {
  
  Lambert_orig <- with(Lambert, effect_size_ABk(outcome, treatment, case, phase, time))
  Lambert_new <- with(Lambert[sample.int(nrow(Lambert)),], effect_size_ABk(outcome, treatment, case, phase, time))
  expect_identical(Lambert_orig, Lambert_new)
  
  Anglesea_orig <- with(Anglesea, effect_size_ABk(outcome, condition, case, phase, session))
  Anglesea_new <- with(Anglesea[sample.int(nrow(Anglesea)),], effect_size_ABk(outcome, condition, case, phase, session))
  expect_identical(Anglesea_orig, Anglesea_new)
  
  Thorne$phase_pair <- with(Thorne, substr(phase_id, 2, 2))
  Thorne_A <- subset(Thorne, measure == "Academic Engagement")
  Thorne_A_orig <- with(Thorne_A, effect_size_ABk(outcome, condition, case, phase_pair, session))
  Thorne_A_new <- with(Thorne_A[sample.int(nrow(Thorne_A)),], effect_size_ABk(outcome, condition, case, phase_pair, session))
  expect_identical(Thorne_A_orig, Thorne_A_new)
  
  Thorne_B <- subset(Thorne, measure == "Inappropriate Verbalizations")
  Thorne_B_orig <- with(Thorne_B, effect_size_ABk(outcome, condition, case, phase_pair, session))
  Thorne_B_new <- with(Thorne_B[sample.int(nrow(Thorne_B)),], effect_size_ABk(outcome, condition, case, phase_pair, session))
  expect_identical(Thorne_B_orig, Thorne_B_new)
  
})

test_that("Order doesn't matter for multiple baseline designs", {
  
  Saddler_1 <- subset(Saddler, measure=="writing quality")
  Saddler_orig <- with(Saddler_1, effect_size_MB(outcome, treatment, case, time))
  Saddler_new <- with(Saddler_1[sample.int(nrow(Saddler_1)),], effect_size_MB(outcome, treatment == "treatment", case, time))
  expect_identical(Saddler_orig, Saddler_new)
  
  Laski_orig <- with(Laski, effect_size_MB(outcome, treatment, case, time))
  Laski_new <- with(Laski[sample.int(nrow(Laski)),], effect_size_MB(outcome, treatment == "treatment", case, time))
  expect_identical(Laski_orig, Laski_new)
  
})

test_that("MB and ABk give similar results", {
  
  S1_MB <- with(subset(Saddler, measure=="writing quality"), effect_size_MB(outcome, treatment == "treatment", case, time))
  S1_ABk <- with(subset(Saddler, measure=="writing quality"), effect_size_ABk(outcome, treatment, case, rep(1, length(outcome)), time))
  expect_equal(S1_MB$D_bar, S1_ABk$D_bar)

  Laski_MB <- with(Laski, effect_size_MB(outcome, treatment == "treatment", case, time))
  Laski_ABk <- with(Laski, effect_size_ABk(outcome, treatment, case, rep(1, length(outcome)), time))
  expect_equal(Laski_MB$D_bar, Laski_ABk$D_bar)
  
})

