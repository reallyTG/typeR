## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
rBinomMix = function(n, alpha, theta, size) {
  nindex = rmultinom(1, size=n, prob=alpha)
  rbinom(n, size, rep(theta, nindex))
}

## ------------------------------------------------------------------------
numTrials = 30
trueNumComponents = 4
alpha = rep(1 / trueNumComponents, trueNumComponents)
theta = seq(0.2, 0.8, length = trueNumComponents)

## ---- echo=FALSE, fig.cap="10000 random samples from a binomial mixture model with 4 components"----
set.seed(1138)
barplot(table(rBinomMix(10000, alpha, theta, numTrials)))

## ------------------------------------------------------------------------
maxNumComponents = 7

## ------------------------------------------------------------------------
set.seed(11)
Y = rBinomMix(100, alpha, theta, numTrials)
library(sBIC)
binomMix = BinomialMixtures(maxNumComponents, phi = 1)

## ------------------------------------------------------------------------
a = sBIC(cbind(Y, numTrials-Y), binomMix)

## ------------------------------------------------------------------------
a$BIC - max(a$BIC)
a$sBIC - max(a$sBIC)

## ------------------------------------------------------------------------
binomMix$setPhi(0.5)

## ------------------------------------------------------------------------
a = sBIC(NULL, binomMix)
a$sBIC - max(a$sBIC)

## ------------------------------------------------------------------------
nSim = 200
sampleSizes = c(50, 200, 500)
set.seed(11)

## ---- eval=FALSE---------------------------------------------------------
#  bictable <- vector("list", length(sampleSizes))
#  for (i in  seq_along(sampleSizes)) {
#    results <- matrix(0, nrow=nSim, ncol=3, dimnames=list(NULL, c("BIC","sBIC1","sBIC05")))
#    for (j in 1:nSim) {
#      Y = rBinomMix(sampleSizes[i], alpha, theta, numTrials)
#      X = cbind(Y, numTrials - Y)
#  
#      binomMix = BinomialMixtures(maxNumComponents, phi = 1)
#      out = sBIC(X, binomMix)
#      nc.BIC =  which.max(out$BIC)
#      nc.sBIC1 = which.max(out$sBIC)
#  
#      binomMix$setPhi(0.5)
#      out = sBIC(NULL, binomMix)
#      nc.sBIC05 = which.max(out$sBIC)
#      results[j, ] <- c(nc.BIC, nc.sBIC1, nc.sBIC05)
#    }
#    bictable[[i]] <- apply(results, 2, tabulate, nbins=maxNumComponents)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  par(mfrow=c(1, length(bictable)))
#  for (i in 1:length(bictable)) {
#    tab <- t(bictable[[i]])
#    barplot(t(bictable[[i]]), beside=TRUE, ylim=c(0, nSim), names.arg=1:maxNumComponents,
#            col=c("white","grey","black"),
#            legend = c(expression(BIC), expression(bar(sBIC)[1]), expression(bar(sBIC)[0.5])),
#            sub=paste("n =", sampleSizes[i])
#  }

