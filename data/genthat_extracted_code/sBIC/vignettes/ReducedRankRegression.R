## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
simRR <- function(N, M, n, r) {
    
    sing.vals = (r:1) / r + 1 / r
    B = rortho(N)[,1:r] %*% diag(sing.vals) %*% rortho(M)[1:r,]
    X = matrix(rnorm(M * n), M, n)
    Y = B %*% X + matrix(rnorm(N * n), N, n)

    list(X=X, Y=Y)
}

## ------------------------------------------------------------------------
rortho = function(n) {
  return(qr.Q(qr(array(runif(n), dim = c(n, n)))))
}

## ------------------------------------------------------------------------
M = 15
N = 10
r = 5

## ------------------------------------------------------------------------
set.seed(1234)
library(sBIC)
rreg = ReducedRankRegressions(numResponses=N, numCovariates=M, maxRank=min(M, N))

## ------------------------------------------------------------------------
XY = simRR(N, M, 100, r)
results = sBIC(XY, rreg)
results

## ------------------------------------------------------------------------
which.max(results$BIC) - 1
which.max(results$sBIC) -1

## ------------------------------------------------------------------------
set.seed(1234)
n = c(50, 100, 200, 300, 500, 1000)
sims = 200

## ------------------------------------------------------------------------
tt <- vector("list", length(n))
for (i in seq_along(n)) {
  
  rank.bic = rank.sbic = factor(rep(0, sims), levels = 0:min(M, N))

  for (j in 1:sims) {
    rreg = ReducedRankRegressions(N, M, min(M, N))
    XY = simRR(N, M, n[i], r)
    results = sBIC(XY, rreg)

    rank.bic[j] = which.max(results$BIC) - 1
    rank.sbic[j] = which.max(results$sBIC) - 1
  }

  tt[[i]] = rbind("BIC"=table(rank.bic),"sBIC"=table(rank.sbic))
}

## ---- echo=FALSE, fig.cap="Frequencies of rank estimates in reduced rank regression for a model with true rank 5"----
par(mfrow=c(2,3), mar=c(2,1,3,1)+0.1, oma=c(0,2,1,0))
for (i in 1:6) {
  barplot(tt[[i]], beside=TRUE, ylim=c(0, sims), col=c("white","black"),
          legend=c("BIC", "sBIC"), main=paste("n=",n[i]))
}

