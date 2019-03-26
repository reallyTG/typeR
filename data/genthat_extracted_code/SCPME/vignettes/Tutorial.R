## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- message = FALSE, echo = TRUE---------------------------------------
library(SCPME)
set.seed(123)

# generate data from a sparse oracle precision matrix.
# we can use the built-in `data_gen` function

# generate 100 x 5 X data matrix and 100 x 1 Y data matrix
data = data_gen(p = 5, n = 100, r = 1)

# the default regression coefficients are sparse
data$betas

# default oracle precision matrix is also sparse
round(qr.solve(data$SigmaX), 5)

# snap shot of X data matrix
head(data$X)

# snap shot of Y data matrix
head(data$Y)


## ---- message = FALSE, echo = TRUE---------------------------------------

# print oracle covariance matrix
data$SigmaX

# print inverse covariance matrix (omega)
round(qr.solve(data$SigmaX), 5)


## ---- message = FALSE, echo = TRUE---------------------------------------

# print inverse of sample precision matrix (perhaps a bad estimate)
round(qr.solve(cov(data$X)*(nrow(data$X) - 1)/nrow(data$X)), 5)


## ---- message = FALSE, echo = TRUE---------------------------------------

# lasso penalty
shrink(X = data$X, Y = data$Y)


## ---- message = FALSE, echo = TRUE---------------------------------------

# lasso penalty with crit.cv = loglik
shrink(X = data$X, Y = data$Y, crit.cv = "loglik")


## ---- message = FALSE, echo = TRUE---------------------------------------

# produce CV heat map
shrink = shrink(X = data$X, nlam = 50, crit.cv = "BIC")
plot(shrink, type = "heatmap")


## ---- message = FALSE, echo = TRUE---------------------------------------

# produce line graph
plot(shrink, type = "line")


## ---- message = FALSE, echo = TRUE---------------------------------------

# keep all estimates using path
shrink = shrink(X = data$X, crit.cv = "loglik", path = TRUE)

# print only first three objects
shrink$Path[,,1:3]


## ---- message = FALSE, echo = TRUE---------------------------------------

# assume sparsity in beta
lam_max = max(abs(crossprod(data$X, data$Y)))
(shrink = shrink(X = data$X, Y = data$Y, B = cov(data$X, data$Y), lam.max = lam_max, nlam = 20))

# plot CV errors
plot(shrink)


## ---- message = FALSE, echo = TRUE---------------------------------------

# print estimated beta matrix
shrink$Z


## ---- message = FALSE, echo = TRUE---------------------------------------

# assume sparsity in beta AND omega
(shrink = shrink(X = data$X, Y = data$Y, B = cbind(cov(data$X, data$Y), diag(ncol(data$X))), lam.max = 10, lam.min.ratio = 1e-4, nlam = 20))

# print estimated beta
shrink$Z[, 1, drop = FALSE]

# plot CV errors
plot(shrink)


## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # reduce number of lam to 5
#  shrink = shrink(X = data$X, Y = data$Y, nlam = 5)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # reduce number of folds to 3
#  shrink = shrink(X = data$X, Y = data$Y, K = 3)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # relax convergence criteria
#  shrink = shrink(X = data$X, Y = data$Y, tol.abs = 1e-3, tol.rel = 1e-3)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # adjust maximum number of iterations
#  shrink = shrink(X = data$X, Y = data$Y, maxit = 1e3)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # adjust adjmaxit
#  shrink = shrink(X = data$X, Y = data$Y, adjmaxit = 2)
#  

## ---- message = FALSE, echo = TRUE, eval = FALSE-------------------------
#  
#  # parallel CV
#  shrink = shrink(X = data$X, Y = data$Y, cores = 2)
#  

