library(steadyICA)


### Name: steadyICA
### Title: Estimate independent components by minimizing distance
###   covariance
### Aliases: steadyICA
### Keywords: distance covariance ICA independent

### ** Examples

set.seed(999)
nObs <- 1024
nComp <- 3
# simulate from some gamma distributions:
simS<-cbind(rgamma(nObs, shape = 1, scale = 2),
            rgamma(nObs, shape = 3, scale = 2),
            rgamma(nObs, shape = 9, scale = 0.5))

#standardize by expected value and variance:
simS[,1] = (simS[,1] - 1*2)/sqrt(1*2^2)
simS[,2] = (simS[,2] - 3*2)/sqrt(3*2^2)
simS[,3] = (simS[,3] - 9*0.5)/sqrt(9*0.5^2)

# slightly revised 'mixmat' function (from ProDenICA)
# for p>=d: uses fastICA and ProDenICA parameterization:
myMixmat <- function (p = 2, d = NULL) {
  if(is.null(d)) d = p
  a <- matrix(rnorm(d * p), d, p)
  sa <- La.svd(a)
  dL <- sort(runif(d) + 1)
  mat <- sa$u%*%(sa$vt*dL)
  attr(mat, "condition") <- dL[d]/dL[1]
  mat
}

simM <- myMixmat(p = 6, d = nComp)
xData <- simS%*%simM
xWhitened <- whitener(xData, n.comp = nComp)

#estimate mixing matrix:
est.steadyICA.v1 = steadyICA(X = xData,whiten=TRUE,n.comp=nComp,verbose = TRUE)

#Define the 'true' W:
W.true <- solve(simM%*%xWhitened$whitener)

frobICA(M1=est.steadyICA.v1$M,M2=simM)
frobICA(S1=est.steadyICA.v1$S,S2=simS)

## Not run: 
##D #now initiate from target:
##D est.steadyICA.v2 = steadyICA(X = xData, w.init= W.true, n.comp = nComp, whiten=TRUE, verbose=TRUE)
##D 
##D #estimate using PIT steadyICA such that dimension reduction is via ICA:
##D est.steadyICA.v3 = steadyICA(X = xData, w.init=ginv(est.steadyICA.v2$M),
##D PIT=TRUE, n.comp = nComp, whiten=FALSE, verbose=TRUE)
##D 
##D frobICA(M1=est.steadyICA.v2$M,M2=simM)
##D frobICA(M1=est.steadyICA.v3$M,M2=simM) 
##D frobICA(S1=est.steadyICA.v2$S,S2=simS)
##D 
##D #tends to be lower than PCA-based (i.e., whitening) methods:
##D frobICA(S1=est.steadyICA.v3$S,S2=simS) 
##D 
##D # JADE uses a different parameterization and different notation.
##D # Using our parameterization and notation, the arguments for 
##D # JADE::amari.error correspond to:
##D amari.error(t(W.hat), W.true)
##D 
##D library(JADE)
##D 
##D amari.error(t(est.steadyICA.v1$W), W.true) 
##D amari.error(t(est.steadyICA.v2$W), W.true)
##D ##note that a square W is not estimated if PIT=TRUE and whiten=FALSE
##D 
##D #Compare performance to fastICA:
##D library(fastICA)
##D est.fastICA = fastICA(X = xData, n.comp = 3, tol=1e-07)
##D amari.error(t(est.fastICA$W), W.true)
##D ##steadyICA usually outperforms fastICA
##D 
##D ##Compare performance to ProDenICA:
##D library(ProDenICA)
##D est.ProDenICA = ProDenICA(x = xWhitened$Z, k = 3, maxit=40,trace=TRUE)
##D amari.error(t(est.ProDenICA$W), W.true)
##D ##ProDenICA and steadyICA tend to be similar when sources
##D ##are continuously differentiable
## End(Not run)



