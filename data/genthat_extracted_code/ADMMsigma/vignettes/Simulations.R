## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # oracle precision matrix
#  Omega = matrix(0.9, ncol = 100, nrow = 100)
#  diag(Omega = 1)
#  
#  # generate covariance matrix
#  S = qr.solve(Omega)
#  
#  # generate data
#  Z = matrix(rnorm(100*50), nrow = 50, ncol = 100)
#  out = eigen(S, symmetric = TRUE)
#  S.sqrt = out$vectors %*% diag(out$values^0.5) %*% t(out$vectors)
#  X = Z %*% S.sqrt
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # oracle precision matrix
#  Omega = matrix(0.9, ncol = 10, nrow = 10)
#  diag(Omega = 1)
#  
#  # generate covariance matrix
#  S = qr.solve(Omega)
#  
#  # generate data
#  Z = matrix(rnorm(10*1000), nrow = 1000, ncol = 10)
#  out = eigen(S, symmetric = TRUE)
#  S.sqrt = out$vectors %*% diag(out$values^0.5) %*% t(out$vectors)
#  X = Z %*% S.sqrt
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE, tidy = FALSE-----------
#  
#  # generate eigen values
#  eigen = c(rep(1000, 5, rep(1, 100 - 5)))
#  
#  # randomly generate orthogonal basis (via QR)
#  Q = matrix(rnorm(100*100), nrow = 100, ncol = 100) %>% qr %>% qr.Q
#  
#  # generate covariance matrix
#  S = Q %*% diag(eigen) %*% t(Q)
#  
#  # generate data
#  Z = matrix(rnorm(100*50), nrow = 50, ncol = 100)
#  out = eigen(S, symmetric = TRUE)
#  S.sqrt = out$vectors %*% diag(out$values^0.5) %*% t(out$vectors)
#  X = Z %*% S.sqrt
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE, tidy = FALSE-----------
#  
#  # generate eigen values
#  eigen = c(rep(1000, 5, rep(1, 10 - 5)))
#  
#  # randomly generate orthogonal basis (via QR)
#  Q = matrix(rnorm(10*10), nrow = 10, ncol = 10) %>% qr %>% qr.Q
#  
#  # generate covariance matrix
#  S = Q %*% diag(eigen) %*% t(Q)
#  
#  # generate data
#  Z = matrix(rnorm(10*50), nrow = 50, ncol = 10)
#  out = eigen(S, symmetric = TRUE)
#  S.sqrt = out$vectors %*% diag(out$values^0.5) %*% t(out$vectors)
#  X = Z %*% S.sqrt
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE, tidy = FALSE-----------
#  
#  # generate covariance matrix
#  # (can confirm inverse is tri-diagonal)
#  S = matrix(0, nrow = 100, ncol = 100)
#  for (i in 1:100){
#    for (j in 1:100){
#      S[i, j] = 0.7^abs(i - j)
#    }
#  }
#  
#  # generate data
#  Z = matrix(rnorm(10*50), nrow = 50, ncol = 10)
#  out = eigen(S, symmetric = TRUE)
#  S.sqrt = out$vectors %*% diag(out$values^0.5) %*% t(out$vectors)
#  X = Z %*% S.sqrt
#  

