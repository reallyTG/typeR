context("Tau variance estimator")

Tau_est <- function(yA, yB) {

  U <- sapply(yB, function(j) (j > yA) - (j < yA))
  m <- length(yA)
  n <- length(yB)
  
  Tau <- sum(U) / (m * n)
  
  # Hanley-McNeil variance estimator
  Q1 <- sum(rowSums(U)^2) / (m * n^2)
  Q2 <- sum(colSums(U)^2) / (m^2 * n)
  V_HM <- (1 - Tau^2 + (n - 1) * (Q1 - Tau^2) + (m - 1) * (Q2 - Tau^2)) / (m * n)
  
  # Unbiased variance estimator
  X <- sum(U^2) / (m * n)
  V_U <- (1 + n * Q1 + m * Q2 - (m + n - 1) * Tau^2 - 2 * X) / ((m - 1) * (n - 1))
  
  # Jack-knife variance estimator
  V_JK <- Q1 / (m - 1) + Q2 / (n - 1) - Tau^2 * (1 / (m - 1) + 1 / (n - 1)) + (1 - X) * (1 / (m * (n - 1)) + 1 / (n * (m - 1)))
  
  data.frame(Tau = Tau, HM = sqrt(V_HM), Unb = sqrt(V_U), JK = sqrt(V_JK))
}

A_data <- rpois(10, lambda = 10)
B_data <- rpois(12, lambda = 12)

test_that("Tau SEs agree with above.", {
  
  Tau_check <- Tau_est(yA = A_data, yB = B_data)
  unbiased <- Tau(A_data, B_data, SE = "unbiased", confidence = NULL)$SE
  Hanley <- Tau(A_data, B_data, SE = "Hanley", confidence = NULL)$SE

  expect_equal(Tau_check$Unb, unbiased)
  expect_equal(Tau_check$HM, Hanley)
  
})
