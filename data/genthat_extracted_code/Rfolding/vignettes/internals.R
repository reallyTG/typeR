## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
Xm = c(rnorm(1000,0,1),rnorm(1000,5,1))
hist(Xm, freq=TRUE, nclass=60, col="#1B4B5A")

## ---- echo=TRUE----------------------------------------------------------
print(var(Xm))

## ---- echo=TRUE----------------------------------------------------------
s = 2.5
hist(abs(Xm - s), freq=TRUE, nclass=60, col="#F55449")

## ---- echo=TRUE----------------------------------------------------------
Xu = rnorm(5000,0,1)
hist(Xu, freq=TRUE, nclass=60, col="#1B4B5A")

## ------------------------------------------------------------------------
f = function(s) {var(abs(Xu-s))}
optim_results = optim(2.0, f, method="BFGS")
s_star = optim_results$par
print(s_star)

