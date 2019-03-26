## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- message = FALSE, echo = TRUE---------------------------------------
library(ADMMsigma)

#  generate data from a sparse matrix
# first compute covariance matrix
S = matrix(0.7, nrow = 5, ncol = 5)
for (i in 1:5){
  for (j in 1:5){
    S[i, j] = S[i, j]^abs(i - j)
  }
}

# generate 100 x 5 matrix with rows drawn from iid N_p(0, S)
set.seed(123)
Z = matrix(rnorm(100*5), nrow = 100, ncol = 5)
out = eigen(S, symmetric = TRUE)
S.sqrt = out$vectors %*% diag(out$values^0.5) %*% t(out$vectors)
X = Z %*% S.sqrt

# snap shot of data
head(X)


## ---- message = FALSE, echo = TRUE---------------------------------------

# print oracle covariance matrix
S

# print inverse covariance matrix (omega)
round(qr.solve(S), 5)


## ---- message = FALSE, echo = TRUE---------------------------------------

# print inverse of sample precision matrix (perhaps a bad estimate)
round(qr.solve(cov(X)*(nrow(X) - 1)/nrow(X)), 5)


## ---- message = FALSE, echo = TRUE---------------------------------------

# elastic-net type penalty (set tolerance to 1e-8)
ADMMsigma(X, tol.abs = 1e-8, tol.rel = 1e-8)


## ---- message = FALSE, echo = TRUE---------------------------------------

# lasso penalty (default tolerance)
ADMMsigma(X, alpha = 1)



## ---- message = FALSE, echo = TRUE---------------------------------------

# elastic-net penalty (alpha = 0.5)
ADMMsigma(X, alpha = 0.5)


## ---- message = FALSE, echo = TRUE---------------------------------------

# ridge penalty
ADMMsigma(X, alpha = 0)

# ridge penalty (using closed-form solution)
RIDGEsigma(X, lam = 10^seq(-8, 8, 0.01))


## ---- message = FALSE, echo = TRUE---------------------------------------

# produce CV heat map for ADMMsigma
ADMM = ADMMsigma(X, tol.abs = 1e-8, tol.rel = 1e-8)
plot(ADMM, type = "heatmap")


## ---- message = FALSE, echo = TRUE---------------------------------------

# produce line graph for CV errors for ADMMsigma
plot(ADMM, type = "line")


## ---- message = FALSE, echo = TRUE---------------------------------------

# produce CV heat map for RIDGEsigma
RIDGE = RIDGEsigma(X, lam = 10^seq(-8, 8, 0.01))
plot(RIDGE, type = "heatmap")

# produce line graph for CV errors for RIDGEsigma
plot(RIDGE, type = "line")


## ---- message = FALSE, echo = TRUE---------------------------------------

# AIC
plot(ADMMsigma(X, crit.cv = "AIC"))

# BIC
plot(ADMMsigma(X, crit.cv = "BIC"))


## ---- message = FALSE, echo = TRUE---------------------------------------

# keep all estimates using path
ADMM = ADMMsigma(X, path = TRUE)

# print only first three objects
ADMM$Path[,,1:3]


## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # reduce number of lam to 5
#  ADMM = ADMMsigma(X, nlam = 5)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # reduce number of folds to 3
#  ADMM = ADMMsigma(X, K = 3)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # relax convergence criteria
#  ADMM = ADMMsigma(X, tol.abs = 1e-3, tol.rel = 1e-3)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # adjust maximum number of iterations
#  ADMM = ADMMsigma(X, maxit = 1e3)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # adjust adjmaxit
#  ADMM = ADMMsigma(X, maxit = 1e4, adjmaxit = 2)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # parallel CV
#  ADMM = ADMMsigma(X, cores = 3)
#  

