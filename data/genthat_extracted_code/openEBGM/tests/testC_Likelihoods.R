context("Likelihood Functions")
#For testing if the likelihood functions work properly

#Create some counts data -------------------------------------------------------
datN <- data.frame(N = c(rep(0, 5), rep(1, 4), rep(2, 6), rep(3, 2)),
                   E = 1:17)
datni <- data.frame(ni = c(rep(0, 3), rep(1, 2), rep(2, 3), rep(3, 2)),
                    ei = 1:10,
                    weight = 0.1)

theta_hat <- c(0.125874, 0.13587, 1.24578, 3.01587, 0.05)

# Manually calculate -LL functions ---------------------------------------------
alpha1 <- theta_hat[1]
beta1  <- theta_hat[2]
alpha2 <- theta_hat[3]
beta2  <- theta_hat[4]
P      <- theta_hat[5]

#negLLzero()
coeff1 <- gamma(alpha1 + datN$N) / (gamma(alpha1) * factorial(datN$N))
coeff2 <- gamma(alpha2 + datN$N) / (gamma(alpha2) * factorial(datN$N))
prob1  <- beta1 / (beta1 + datN$E)
prob2  <- beta2 / (beta2 + datN$E)
f1     <- coeff1 * (prob1 ^ alpha1) * ((1 - prob1) ^ datN$N)
f2     <- coeff2 * (prob2 ^ alpha2) * ((1 - prob2) ^ datN$N)

negLLzero_test <- (P * f1) + ((1 - P) * f2)
negLLzero_test <- -sum(log(negLLzero_test))

testthat::test_that("does negLLzero() result make sense?", {
  expect_equal(negLLzero_test,
               negLLzero(theta_hat, N = datN$N, E = datN$E)
               )
})

#negLLzeroSquash()
coeff1 <- gamma(alpha1 + datni$ni) / (gamma(alpha1) * factorial(datni$ni))
coeff2 <- gamma(alpha2 + datni$ni) / (gamma(alpha2) * factorial(datni$ni))
prob1  <- beta1 / (beta1 + datni$ei)
prob2  <- beta2 / (beta2 + datni$ei)
f1     <- coeff1 * (prob1 ^ alpha1) * ((1 - prob1) ^ datni$ni)
f2     <- coeff2 * (prob2 ^ alpha2) * ((1 - prob2) ^ datni$ni)

negLLzeroSquash_test <- datni$weight * log((P * f1) + ((1 - P) * f2))
negLLzeroSquash_test <- -sum(negLLzeroSquash_test)

testthat::test_that("does negLLzeroSquash() result make sense?", {
  expect_equal(negLLzeroSquash_test,
               negLLzeroSquash(theta_hat, ni = datni$ni, ei = datni$ei,
                               wi = datni$weight)
               )
})

#negLL(); let N_star = 2
datN2   <- datN[datN$N >= 2, ]
coeff1  <- gamma(alpha1 + datN2$N) / (gamma(alpha1) * factorial(datN2$N))
coeff2  <- gamma(alpha2 + datN2$N) / (gamma(alpha2) * factorial(datN2$N))
prob1   <- beta1 / (beta1 + datN2$E)
prob2   <- beta2 / (beta2 + datN2$E)
f1      <- coeff1 * (prob1 ^ alpha1) * ((1 - prob1) ^ datN2$N)
f2      <- coeff2 * (prob2 ^ alpha2) * ((1 - prob2) ^ datN2$N)
f1_0    <- (gamma(alpha1 + 0) / (gamma(alpha1) * factorial(0))) *
             (prob1 ^ alpha1) * ((1 - prob1) ^ 0)
f1_1    <- gamma(alpha1 + 1) / (gamma(alpha1) * factorial(1)) *
             (prob1 ^ alpha1) * ((1 - prob1) ^ 1)
f1_star <- f1 / (1 - (f1_0 + f1_1))
f2_0    <- gamma(alpha2 + 0) / (gamma(alpha2) * factorial(0)) *
             (prob2 ^ alpha2) * ((1 - prob2) ^ 0)
f2_1    <- gamma(alpha2 + 1) / (gamma(alpha2) * factorial(1)) *
             (prob2 ^ alpha2) * ((1 - prob2) ^ 1)
f2_star <- f2 / (1 - (f2_0 + f2_1))

negLL_test <- (P * f1_star) + ((1 - P) * f2_star)
negLL_test <- -sum(log(negLL_test))

testthat::test_that("does negLL() result make sense?", {
  expect_equal(negLL_test,
               negLL(theta_hat, N = datN2$N, E = datN2$E, N_star = 2)
  )
})

#negLLsquash();  let N_star = 2
datni2  <- datni[datni$ni >= 2, ]
coeff1  <- gamma(alpha1 + datni2$ni) / (gamma(alpha1) * factorial(datni2$ni))
coeff2  <- gamma(alpha2 + datni2$ni) / (gamma(alpha2) * factorial(datni2$ni))
prob1   <- beta1 / (beta1 + datni2$ei)
prob2   <- beta2 / (beta2 + datni2$ei)
f1      <- coeff1 * (prob1 ^ alpha1) * ((1 - prob1) ^ datni2$ni)
f2      <- coeff2 * (prob2 ^ alpha2) * ((1 - prob2) ^ datni2$ni)
f1_0 <- (gamma(alpha1 + 0) / (gamma(alpha1) * factorial(0))) *
          (prob1 ^ alpha1) * ((1 - prob1) ^ 0)
f1_1 <- gamma(alpha1 + 1) / (gamma(alpha1) * factorial(1)) *
          (prob1 ^ alpha1) * ((1 - prob1) ^ 1)
f1_star <- f1 / (1 - (f1_0 + f1_1))
f2_0 <- gamma(alpha2 + 0) / (gamma(alpha2) * factorial(0)) *
          (prob2 ^ alpha2) * ((1 - prob2) ^ 0)
f2_1 <- gamma(alpha2 + 1) / (gamma(alpha2) * factorial(1)) *
          (prob2 ^ alpha2) * ((1 - prob2) ^ 1)
f2_star <- f2 / (1 - (f2_0 + f2_1))

negLLsquash_test <- log((P * f1_star) + ((1 - P) * f2_star))
negLLsquash_test <- datni2$weight * negLLsquash_test
negLLsquash_test <- -sum(negLLsquash_test)

testthat::test_that("does negLLsquash() result make sense?", {
  expect_equal(negLLsquash_test,
               negLLsquash(theta_hat, ni = datni2$ni, ei = datni2$ei,
                           wi = datni2$weight, N_star = 2)
               )
})

#Error handling checks ---------------------------------------------------------
testthat::test_that("do negLLzero() errors get correctly printed?", {
  expect_error(
    negLLzero(theta = theta_hat,
              N = datN$N,
              E = datni$ei),
    "'N' & 'E' must be the same length",
    fixed = TRUE
  )
  expect_error(
    negLLzero(theta = theta_hat,
              N = datN[datN$N > 0, "N"],
              E = datN[datN$N > 0, "E"]),
    "no zero counts found -- please use another likelihood function",
    fixed = TRUE
  )
})

testthat::test_that("do negLLzeroSquash() errors get correctly printed?", {
  expect_error(
    negLLzeroSquash(theta = theta_hat,
                    ni = datni$ni,
                    ei = datN$E,
                    wi = datni$weight),
    "'ni', 'ei', & 'wi' must be the same length",
    fixed = TRUE
  )
  expect_error(
    negLLzeroSquash(theta = theta_hat,
                    ni = datni[datni$ni > 0, "ni"],
                    ei = datni[datni$ni > 0, "ei"],
                    wi = datni[datni$ni > 0, "weight"]),
    "no zero counts found -- please use another likelihood function",
    fixed = TRUE
  )
})

testthat::test_that("do negLL() errors get correctly printed?", {
  expect_error(
    negLL(theta = theta_hat,
          N = datN$N,
          E = datni$ei,
          N_star = 1),
    "'N' & 'E' must be the same length",
    fixed = TRUE
  )
  expect_error(
    negLL(theta = theta_hat,
          N = datN$N,
          E = datN$E,
          N_star = 1),
    "'N_star' does not agree with 'N'",
    fixed = TRUE
  )
  expect_error(
    negLL(theta = theta_hat,
          N = datN[datN$N > 1, "N"],
          E = datN[datN$N > 1, "E"],
          N_star = 1),
    "'N_star' does not agree with 'N'",
    fixed = TRUE
  )
})

testthat::test_that("do negLLsquash() errors get correctly printed?", {
  expect_error(
    negLLsquash(theta = theta_hat,
                ni = datni$ni,
                ei = datN$E,
                wi = datni$weight),
    "'ni', 'ei', & 'wi' must be the same length",
    fixed = TRUE
  )
  expect_error(
    negLLsquash(theta = theta_hat,
                ni = datni$ni,
                ei = datni$ei,
                wi = datni$weight,
                N_star = 1),
    "'N_star' does not agree with 'ni'",
    fixed = TRUE
  )
  expect_error(
    negLLsquash(theta = theta_hat,
                ni = datni[datni$ni > 1, "ni"],
                ei = datni[datni$ni > 1, "ei"],
                wi = datni[datni$ni > 1, "weight"],
                N_star = 1),
    "'N_star' does not agree with 'ni'",
    fixed = TRUE
  )
})
