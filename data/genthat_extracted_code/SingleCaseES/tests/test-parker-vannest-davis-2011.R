context("Parker, Vannest, and Davis (2011).")

A <- c(20, 20, 26, 25, 22, 23)
B <- c(28, 25, 24, 27, 30, 30, 29)

NOMs <- calc_ES(A, B, improvement = "increase", 
                ES = c("PND","PAND","PEM","IRD","NAP","Tau"),
                SE = "none", confidence = NULL)

test_that("PND is correct.", {
  pnd <- PND(A, B, improvement = "increase")
  expect_equal(5 / 7, pnd$Est)
  expect_equal(pnd, subset(NOMs, ES == "PND"))
})

test_that("PAND is correct.", {
  pand <- PAND(A, B, improvement = "increase")
  expect_equal(1 - 2 / 13, pand$Est)
  expect_equal(pand, subset(NOMs, ES == "PAND"), check.attributes = FALSE)
})

test_that("PEM is correct.", {
  pem <- PEM(A, B, improvement = "increase")
  expect_equal(7 / 7, pem$Est)
  expect_equal(pem, subset(NOMs, ES == "PEM"), check.attributes = FALSE)
})

test_that("Robust IRD is correct.", {
  ird <- IRD(A, B, improvement = "increase")
  expect_equal(6 / 7 - 1 / 6, ird$Est)
  expect_equal(ird, subset(NOMs, ES == "IRD"), check.attributes = FALSE)
})

test_that("NAP is correct.", {
  nap <- NAP(A, B, improvement = "increase", SE = "none", confidence = NULL)
  expect_equal(38.5 / 42, nap$Est)
  expect_equal(nap, subset(NOMs, ES == "NAP"), check.attributes = FALSE)
})

test_that("Tau is correct (example 1).", {
  tau <- Tau(A, B, improvement = "increase", SE = "none", confidence = NULL)
  expect_equal((38 - 3) / 42, tau$Est)
  expect_equal(tau, subset(NOMs, ES == "Tau"), check.attributes = FALSE)
})



A <- c(3, 3, 4, 5)
B <- c(4, 5, 6, 7, 7)
NOMs <- calc_ES(A, B, improvement = "increase",
                ES = c("Tau","Tau_U"), 
                SE = "none", confidence = NULL)

test_that("Tau is correct (example 2).", {
  tau <- Tau(A, B, improvement = "increase", SE = "none", confidence = NULL)
  expect_equal(16 / 20, tau$Est)
  expect_equal(tau, subset(NOMs, ES == "Tau"), check.attributes = FALSE)
})

test_that("Tau-U is correct (example 2).", {
  tauU <- Tau_U(A, B, improvement = "increase")
  expect_equal(11 / 20, tauU$Est)
  expect_equal(tauU, subset(NOMs, ES == "Tau-U"), check.attributes = FALSE)
})
