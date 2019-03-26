context("kNN estimates")

test_that("KSG",{
  x   <- seq(0,100,0.1)
  y   <- seq(1,101,0.1)
  mi1 <- knn_mi(cbind(x,y),c(1,1),options = list(method = "KSG1", k = 5))
  expect_true(abs(mi1 - 5.391681) < 0.1)
  mi2 <- knn_mi(cbind(x,y),c(1,1),options = list(method = "KSG2", k = 5))
  expect_true(abs(mi2 - 5.031308) < 0.1)
}
)

test_that("LNC",{
  set.seed(123)
  n <- 500
  T <- matrix(c(1,0.7,0.7,1),ncol=2,nrow=2)
  x <- t(T%*%matrix(rnorm(2*n),nrow=2))
  mi <- knn_mi(x,c(1,1),options = list(method = "LNC", k = 10, alpha = c(0.6868716,0,0)))
  TT <- t(T)%*%T
  r  <- TT[1,2]/TT[2,2]
  expect_true((mi + 0.5*log(1-r^2) < 1))
  mi_log <- knn_mi(x,c(1,1),options = list(method = "LNC", k = 10, alpha = c(log(0.6868716),0,0)))
  expect_true(abs(mi - mi_log) < 1)
}
)
