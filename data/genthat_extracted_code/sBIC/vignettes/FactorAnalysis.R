## ----setup, include=FALSE------------------------------------------------

knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
X = read.table("lopeswest.dat", header = TRUE)
X = as.matrix(X[, c("U.S.A.", "Canada", "Yen", "Franc", "Lira", "Mark")])
Y = scale(diff(X))

## ------------------------------------------------------------------------
factanal(Y, factors=2)

## ------------------------------------------------------------------------
library(sBIC)
factorAnalyses = FactorAnalyses(numCovariates=ncol(Y), maxNumFactors=3)

## ------------------------------------------------------------------------
lambda <- matrix("", 4, 4, dimnames=list(paste0("i=",0:3), paste0("j=",0:3)))
for (i in 1:4) {
  for (j in 1:i) {
    lambda[i,j] <- factorAnalyses$learnCoef(i, j)$lambda
  }
}
knitr::kable(lambda, caption="Learning coefficients $\\lambda_{ij}$ for sBIC")

## ------------------------------------------------------------------------
results = sBIC(Y, factorAnalyses)
print(results)

## ------------------------------------------------------------------------
BICpost <- function(BIC) {
  w = exp((BIC - max(BIC)))
  zapsmall( w/ sum(w) )
}

## ------------------------------------------------------------------------
BICpost(results$BIC)
BICpost(results$sBIC)

