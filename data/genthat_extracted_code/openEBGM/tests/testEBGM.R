context("Posterior Estimation")

data(caers)
proc_dat_ustrat <- processRaw(data = caers, stratify = FALSE)
N <- proc_dat_ustrat$N
E <- proc_dat_ustrat$E

#Theta values from previous run
theta <- c(3.25280367, 0.39983376,
           2.02490400, 1.90726819,
           0.06536416)
names(theta) <- c("alpha1", "beta1",
                  "alpha2", "beta2",
                  "p")

q_calc <- Qn(theta_hat = theta, N = N, E = E)
eb_scores <- ebgm(theta_hat = theta, N = N, E = E, qn = q_calc)
eb_05 <- quantBisect(percent = 5, theta_hat = theta, N = N, E = E, qn = q_calc)
eb_95 <- quantBisect(percent = 95, theta_hat = theta, N = N, E = E, qn = q_calc)

testthat::test_that("Checking the length of the posterior calculations", {
  expect_equal(length(q_calc), nrow(proc_dat_ustrat))
  expect_equal(length(eb_scores), nrow(proc_dat_ustrat))
  expect_equal(length(eb_05), nrow(proc_dat_ustrat)) #don't need to test eb_95 since from same fcn
})

testthat::test_that("Checking that the calculated values are logical", {
  expect_true(max(q_calc) <= 1)
  expect_true(min(q_calc) >= 0)

  expect_true(max(eb_scores) < Inf)
  expect_true(min(eb_scores) >= 0)

  expect_true(max(eb_95) < Inf)
  expect_true(min(eb_95) >= 0)
  expect_true(max(eb_05) < Inf)
  expect_true(min(eb_05) >= 0)

  expect_true(all(eb_95 >= eb_scores))
  expect_true(all(eb_05 <= eb_scores))
})

N_miss1 <- N
N_miss1[5] <- NA
N_miss2 <- N
N_miss2[3] <- NaN
N_miss3 <- N
N_miss3[4] <- Inf

testthat::test_that("do errors for Qn() get correctly printed?", {
  expect_error(Qn(theta_hat = theta[1:4], N = N, E = E),
               "'theta_hat' must contain 5 values",
               fixed = TRUE)
  expect_error(Qn(theta_hat = c(0.2, 0.2, -0.001, 3, 0.1), N = N, E = E),
               "'theta_hat' must contain only positive values",
               fixed = TRUE)
  expect_error(Qn(theta_hat = c(0.2, 0.2, 0.001, 3, 1.1), N = N, E = E),
               "'theta_hat[5]' (i.e., 'P') must be less than 1",
               fixed = TRUE)
  expect_error(Qn(theta_hat = theta, N = N[1:10], E = E),
               "'N' and 'E' must have the same length",
               fixed = TRUE)
  expect_error(Qn(theta_hat = theta, N = N_miss1, E = E),
               "missing or infinite values for 'N' and 'E' are not allowed",
               fixed = TRUE)
  expect_error(Qn(theta_hat = theta, N = N_miss2, E = E),
               "missing or infinite values for 'N' and 'E' are not allowed",
               fixed = TRUE)
  expect_error(Qn(theta_hat = theta, N = N_miss3, E = E),
               "missing or infinite values for 'N' and 'E' are not allowed",
               fixed = TRUE)
})

q_miss1 <- q_calc
q_miss1[5] <- NA
q_miss2 <- q_calc
q_miss2[3] <- NaN
q_miss3 <- q_calc
q_miss3[4] <- Inf

testthat::test_that("do errors for ebgm() get correctly printed?", {
  expect_error(ebgm(theta_hat = theta[1:4], N = N, E = E, qn = q_calc),
               "'theta_hat' must contain 5 values",
               fixed = TRUE)
  expect_error(ebgm(theta_hat = c(0.2, 0.2, -0.001, 3, 0.1), N = N, E = E,
                    qn = q_calc),
               "'theta_hat' must contain only positive values",
               fixed = TRUE)
  expect_error(ebgm(theta_hat = c(0.2, 0.2, 0.001, 3, 1.1), N = N, E = E,
                    qn = q_calc),
               "'theta_hat[5]' (i.e., 'P') must be less than 1",
               fixed = TRUE)
  expect_error(ebgm(theta_hat = theta, N = N, E = E, qn = q_calc[1:10]),
               "'N', 'E', and 'qn' must have the same length",
               fixed = TRUE)
  expect_error(ebgm(theta_hat = theta, N = N_miss1, E = E, qn = q_miss1),
               "missing or infinite values for 'N', 'E', and 'qn' are not allowed",
               fixed = TRUE)
  expect_error(ebgm(theta_hat = theta, N = N_miss2, E = E, qn = q_miss2),
               "missing or infinite values for 'N', 'E', and 'qn' are not allowed",
               fixed = TRUE)
  expect_error(ebgm(theta_hat = theta, N = N_miss3, E = E, qn = q_miss3),
               "missing or infinite values for 'N', 'E', and 'qn' are not allowed",
               fixed = TRUE)
})

testthat::test_that("do errors for quantBisect() get correctly printed?", {
  expect_error(quantBisect(percent = 0.05, theta_hat = theta, N = N, E = E,
                           qn = q_calc),
               "'percent' must be a value between 1 and 99 (inclusive)",
               fixed = TRUE)
  expect_error(quantBisect(percent = 5, theta_hat = c(0.2, 0.2, -0.001, 3, 0.1),
                           N = N, E = E, qn = q_calc),
               "'theta_hat' must contain only positive values",
               fixed = TRUE)
  expect_error(quantBisect(percent = 5, theta_hat = c(0.2, 0.2, 0.001, 3, 1.1),
                           N = N, E = E, qn = q_calc),
               "'theta_hat[5]' (i.e., 'P') must be less than 1",
               fixed = TRUE)
  expect_error(quantBisect(percent = 5, theta_hat = theta, N = N, E = E,
                           qn = q_calc[1:10]),
               "'N', 'E', and 'qn' must have the same length",
               fixed = TRUE)
  expect_error(quantBisect(percent = 5, theta_hat = theta, N = N_miss3, E = E,
                           qn = q_miss3),
               "missing or infinite values for 'N', 'E', and 'qn' are not allowed",
               fixed = TRUE)
  expect_error(quantBisect(percent = 5, theta_hat = theta, N = N + 10000000, E = E,
                           qn = q_calc),
               "increase maximum for 'limits'",
               fixed = TRUE)
  expect_error(quantBisect(percent = 5, theta_hat = theta, N = N, E = E,
                           qn = q_calc, max_iter = 2),
               "failed to converge -- try adjusting 'limits' or 'max_iter'",
               fixed = TRUE)
})
