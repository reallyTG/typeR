
context("dsaddle")

test_that( "Testing saddlepoint density mode-finding", {
  
  #########
  #### Univariate case
  #########
  
  # Test if it gets close to the mode
  x <- rgamma(10000, 2, 1)
  decay <-  0.2
  
  res <- findMode(x, init = 8, decay = decay)$mode
  
  expect_lt( abs(res - 1.03), 1e-1 )
  
  # Testing gradient with finite differences
  delta <- 1e-6
  posit <- 6
  fd <- (- dsaddle(y = posit + delta, X = x, decay = decay, log = T)$llk + 
           dsaddle(y = posit, X = x, decay = decay, log = T)$llk) / delta 
  
  sadGrad <- -dsaddle(y = posit + delta/2, X = x, decay = decay, deriv = TRUE)$grad
  
  expect_lt( abs(fd - sadGrad), 1e-3 )
  
  
  #########
  #### Multivariate case
  #########
  set.seed(4214)
  library(mvnfast)
  # Test if it gets close to the mode
  decay <- 0.2
  dims <- 3
  A <- matrix(rnorm(dims^2), dims, dims)
  A <- t(A)%*%A
  myMu <- seq.int(0, dims-1)*10
  SIGMA <-  A
  X <- rmvn(n = 2000, mu = myMu, sigma = SIGMA)
  
  init <- colMeans(X) + rmvn(n = 1, mu = rep(0, dims), sigma = SIGMA)
  
  mode <- findMode(X = X, init = drop(init), decay = decay)$mode
  
  expect_true( all(abs(mode - colMeans(X)) / sqrt(diag(SIGMA)) < 1e-1) )
  
  # Testing gradient with finite differences
  dims <- 6
  decay <- 0.5
  A <- matrix(rnorm(dims^2), dims, dims)
  A <- t(A)%*%A
  myMu <- seq.int(1, dims)
  SIGMA <- A
  X <- rmvn(n = 10000, mu = myMu, sigma = SIGMA)
  delta <- 1e-6
  
  fd <- fd_gaus <- sad_grad <- sad_grad_gaus <- numeric(dims)
  for(index in 1:dims)
  {
    pert <- rep(0, dims); 
    pert[index] <- delta
    x = colMeans(X) + rmvn(n = 1, mu = rep(0, dims), sigma = SIGMA)
    
    aa <-  dsaddle(y = x + pert, X = X, decay, log = TRUE)$llk - 
      dsaddle(y = x, X = X, decay, log = TRUE)$llk
    fd[index] <- aa/delta
    sad_grad[index] <- dsaddle(y = x + pert/2, X = X, decay = decay, deriv = TRUE)$grad[index]
    
  }
  
  expect_true( all( abs(sad_grad - fd) / abs(fd) < 1e-3) )
  
}
)


test_that( "Testing if normalization is accounted for", {
  
  ###############
  ########## One dimension
  ###############
  library(mvnfast)
  
  # Test if it gets close to the mode
  x <- rgamma(10000, 2, 1)
  decay <-  0.2
  sc <- 10

  set.seed(412)
  a <- dsaddle(x[1:10], x, decay = decay, log = TRUE, deriv = T, normalize = T, 
               control = list("method" = "IS", "nNorm" = 10))
  
  set.seed(412)
  b <- dsaddle(x[1:10]*sc, x*sc, decay = decay, log = TRUE, deriv = T, normalize = T, 
               control = list("method" = "IS", "nNorm" = 10)) 
  
  # Test log-likelihood and gradient
  expect_lt( max(abs(a$llk - b$llk - log(sc)) / abs(a$llk)), 1e-6 )
  expect_lt( max(abs(a$grad - b$grad*sc) / abs(a$grad)), 1e-6 )
  expect_lt( max(abs(a$logNorm - b$logNorm) / abs(a$logNorm)), 1e-6 )
  
  ###############
  ########## Multiple dimensions
  ###############
  set.seed(4214)
  decay <- 0.2
  dims <- 3
  A <- matrix(rnorm(dims^2), dims, dims)
  A <- t(A)%*%A 
  myMu <- seq.int(0, dims-1)*10
  SIGMA <-  A + diag(0.5, dims)
  X <- rmvn(n = 2000, mu = myMu, sigma = SIGMA)
  
  # Scale random variables
  preCov <- robCov( t(X) )
  sc <- preCov$E
  Xn <- t( sc %*% (t(X) - preCov$mY) )
  
  set.seed(412)
  a <- dsaddle(X[1:10, ], X, decay = decay, log = TRUE, deriv = T, normalize = T, 
                control = list("method" = "LAP"))
  
  set.seed(412)
  b <- dsaddle(Xn[1:10, ], Xn, decay = decay, log = TRUE, deriv = T, normalize = T, 
                control = list("method" = "LAP")) 
    
  # Test log-likelihood and gradient
  expect_lt( max(abs(a$llk - b$llk - sum(log(abs(diag(sc))))) / abs(a$llk)), 1e-2 )
  expect_lt( max(abs(a$grad - b$grad%*%sc) / abs(a$grad)), 1e-6 )
  expect_lt( max(abs(a$logNorm - b$logNorm) / abs(a$logNorm)), 1e-2 )
  
   
}
)


