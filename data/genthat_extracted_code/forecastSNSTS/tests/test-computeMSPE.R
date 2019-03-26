context("computeMSPE")

# In this file we compute the linear forecasts as defined in
# Section 3.4 of the paper naively (with plain R) and compare
# to the C++ implementation that is more efficient.

# We will do it for one t, h, p and N

T <- 25
m <- 7

T <- 250
m <- 50

X <- rnorm(T)

p <- 5
h <- 1

coef <- predCoef(X, p, h, (T-m-h+1):(T-h), c(0,seq(p+1,T-m-h)))$coef


trimmedMSPE <- function(alph1=0, alph2=0) {
  
  auxRes <- array(0, dim = c(m, p, dim(coef)[5]))
  naiveRes <- matrix(0, nrow=p, ncol=dim(coef)[5])
  
  for (j in 1:dim(coef)[5]) {
    for (i in 1:p) {
      mm <- 1
      for (t in (T-m-h+1):(T-h)) {
        # compute forecast
        Xhat <- sum(coef[i,1:i,h,t-(T-m-h),j] * X[t:(t-i+1)])
        auxRes[mm, i, j] <- ( X[t+h] - Xhat )^2
        mm <- mm+1
      }
      auxRes[, i, j] <- sort(auxRes[, i, j])
      
      # from mean.default
      lo <- floor(m * alph1) + 1
      hi <- m - floor(m * alph2)
      
      naiveRes[i, j] <- mean(auxRes[lo:hi, i, j])
    }
  }
  return(naiveRes)
}

naiveRes <- trimmedMSPE(0, 0)
cppRes <- computeMSPEcpp(X, coef, 1, (T-m-h+1):(T-h), 1, 0, 0)

test_that("mspe computation works", {
  expect_equal(sum( (cppRes - naiveRes)^2 ), 0)
})

naiveRes <- trimmedMSPE(0.1, 0.1)
cppRes <- computeMSPEcpp(X, coef, 1, (T-m-h+1):(T-h), 1, 0.1, 0.1)

test_that("mspe computation works with symmetric trimming", {
      expect_equal(sum( (cppRes - naiveRes)^2 ), 0)
    })

