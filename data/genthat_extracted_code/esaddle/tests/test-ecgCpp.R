
context("ecgf")

# "Oracle" R function that estimates the empitical cumulant generating function and its derivative
tmp_ecgf <- function(lambda, X, mix, grad, kum1, kum2)
{
  if(grad > 2 && is.nan(addList[[1]])) stop("if you want the gradient you have to specify the additional arguments")
  
  if(!is.vector(lambda)) lambda <- as.vector(lambda) 
  if (!is.matrix(X)) X <- matrix(X, length(X), 1)
  n <- nrow(X)
  d <- ncol(X)
  lx <- drop( colSums( lambda*t(X) ) )
  alpha <- max(lx)       # constant for preventing overflow
  elx <- exp(lx - alpha) # exp(lambda'x_i - alpha) vector
  
  tmp.K <- log( sum(elx) / n )+alpha
  K <-  mix * ( tmp.K ) + (1 - mix) * ( crossprod(kum1, lambda) + 0.5 * crossprod(lambda, kum2%*%lambda) )
  ret <- list("K" = K)
  
  if(grad > 0)
  {
    tmp.dK <- colSums( elx*X ) / sum( elx )
    ret$dK <- mix * tmp.dK + ( 1-mix ) * ( kum1 + kum2%*%lambda ) 
  }
  
  if(grad > 1)
  {
    tmp.d2K <- crossprod(X, elx * X) / sum(elx) - tcrossprod(tmp.dK, tmp.dK)
    ret$d2K <-  as.matrix( mix * tmp.d2K  + (1-mix) * kum2, drop = FALSE) 
  }
  
  ret$tmp_K <- tmp.K
  ret$tmp_dK <- tmp.K
  ret$tmp_d2K <- tmp.d2K
  
  ret
  
}


# Testing C++ function against the oracle
test_that( "Testing C++ ecgf function against the oracle", {
  
  library(mvnfast)
  d <- 10
  lambda <- rep(0.5, d)
  mix <- 0.5
  grad <- 2
  kum1 <- 1:d
  tmp <- matrix(rnorm(d^2), d, d)
  kum2 <- tcrossprod(tmp, tmp)
  X <- rmvn(1000, kum1, kum2)
  
  oracle <- tmp_ecgf(lambda, X, mix, grad, kum1, kum2)
  
  cpp_res <- .Call("ecgfCpp",
               lambda_ = lambda, 
               X_ = X, 
               mix_ = mix, 
               grad_ = grad, 
               kum1_ = kum1, 
               kum2_ = kum2,
               PACKAGE = "esaddle")
  
  expect_lt( abs(oracle[[1]] - cpp_res[[1]]), 1e-6 )
  expect_lt( sum(abs(oracle[[2]] - cpp_res[[2]])), 1e-6 )
  expect_lt( sum(sum(abs(oracle[[3]] - cpp_res[[3]]))), 1e-5 )

}
)



