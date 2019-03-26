library(uGMAR)
context("predict method")

params12 <- c(1.0, 0.9, 0.25, 4.5, 0.7, 3.0, 0.8)
params23 <- c(2.7, 0.8, -0.06, 0.3, 3.5, 0.8, -0.07, 2.6, 7.2, 0.3, -0.01, 0.1, 0.6, 0.25)
params12r <- c(1.4, 1.8, 0.9, 0.3, 3.3, 0.8)
params23r <- c(1.7, 1.9, 2.1, 0.8, -0.05, 0.3, 0.7, 4.5, 0.7, 0.2)
R1 <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
R3 <- matrix(c(0.5, 0.5), ncol=1)
R4 <- diag(1, ncol=2, nrow=2)
params22c <- c(1, 0.1, -0.1, 1, 2, 0.2, 2, 0.8, 11, 12) # R4, R3, StMAR
params32cr <- c(1, 2, 0.3, -0.3, 1, 2, 0.6) # R1

gmar12 <- GSMAR(data=VIX, p=1, M=2, params=params12, model="GMAR")
gmar23 <- GSMAR(data=VIX, p=2, M=3, params=params23, model="GMAR")
gmar12r <- GSMAR(data=VIX, p=1, M=2, params=params12r, model="GMAR", restricted=TRUE)
gmar23r <- GSMAR(data=VIX, p=2, M=3, params=params23r, model="GMAR", restricted=TRUE)
stmar22c <- GSMAR(data=VIX, p=2, M=2, params=params22c, model="StMAR", constraints=list(R4, R3))
gmar32cr <- GSMAR(data=VIX, p=3, M=2, params=params32cr, model="GMAR", restricted=TRUE, constraints=R1)

set.seed(1); pred12 <- predict.gsmar(gmar12, n_ahead=1, nsimu=50, plotRes=FALSE, pred_type="mean")
set.seed(2); pred23 <- predict.gsmar(gmar23, n_ahead=3, nsimu=50, ci=c(0.99, 0.90, 0.60), plotRes=FALSE, pred_type="median")
set.seed(3); pred12r <- predict.gsmar(gmar12r, n_ahead=3, nsimu=50, ci=c(0.999, 0.001), plotRes=FALSE, pred_type="median")
set.seed(4); pred23r <- predict.gsmar(gmar23r, n_ahead=1, nsimu=50, ci=c(0.5), plotRes=FALSE, pred_type="mean")
set.seed(5); pred22c <- predict.gsmar(stmar22c, n_ahead=1, nsimu=20, ci=c(0.99, 0.90, 0.60), plotRes=FALSE, pred_type="median")
set.seed(6); pred32cr <- predict.gsmar(gmar32cr, n_ahead=1, nsimu=10, ci=c(0.90), plotRes=FALSE, pred_type="mean")

test_that("predict.gsmar gives correct prediction", {
  expect_equal(pred12$pred, 11.15113, tolerance=1e-3)
  expect_equal(pred23$pred[3], 10.77946, tolerance=1e-3)
  expect_equal(pred12r$pred[2], 11.94374, tolerance=1e-3)
  expect_equal(pred23r$pred, 10.41577, tolerance=1e-3)
  expect_equal(pred22c$pred, 5.702248, tolerance=1e-3)
  expect_equal(pred32cr$pred, 2.112541, tolerance=1e-3)
})

test_that("predict.gsmar gives correct confidence intervals", {
  expect_equal(pred12$conf_ints[1], 10.1512, tolerance=1e-3)
  expect_equal(pred12$conf_ints[3], 11.69211, tolerance=1e-3)
  expect_equal(pred23$conf_ints[3], 9.144938, tolerance=1e-3)
  expect_equal(pred23$conf_ints[11], 11.56006, tolerance=1e-3)
  expect_equal(pred12r$conf_ints[3], 8.716014, tolerance=1e-3)
  expect_equal(pred12r$conf_ints[7], 11.58921, tolerance=1e-3)
  expect_equal(pred23r$conf_ints[2], 11.14477, tolerance=1e-3)
  expect_equal(pred22c$conf_ints[3], 2.971152, tolerance=1e-3)
  expect_equal(pred32cr$conf_ints[2], 3.680976, tolerance=1e-3)
})

params12gs <- c(3.98, 0.68, 0.36, 0.70, 0.94, 11.75, 0.25, 2.03) # M = c(1, 1)
params23gs <- c(2.0, 0.83, 0.01, 0.36, 1.14, 0.90, 0.01, 0.06, 4.23, 0.72, 0.01, 3.85, 0.6, 0.20, 3.3) # M = c(2, 1)
gstmar12 <- GSMAR(VIX, p=1, M=c(1, 1), params=params12gs, model="G-StMAR")
gstmar23 <- GSMAR(VIX, p=2, M=c(2, 1), params=params23gs, model="G-StMAR")
pred12gs <- predict.gsmar(gstmar12, pred_type="cond_mean", plotRes=FALSE)
pred23gs <- predict.gsmar(gstmar23, pred_type="cond_mean", plotRes=FALSE)

test_that("predict.gsmar one-step-cond-mean works correctly", {
  expect_equal(pred12gs$pred, 11.3083, tolerance=1e-4)
  expect_equal(pred23gs$pred, 11.425, tolerance=1e-3)
})
