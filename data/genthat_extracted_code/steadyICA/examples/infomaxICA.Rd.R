library(steadyICA)


### Name: infomaxICA
### Title: Estimates independent components via infomax
### Aliases: infomaxICA

### ** Examples

## Example when p > d. The MD function and amari measures 
# are not defined for M. We can compare the 
# "true W inverse", which is the mixing matrix multiplied 
# by the whitening matrix; alternatively, we can use
# multidcov::frobICA. These two approaches are
# demonstrated below:

set.seed(999)
nObs <- 1024
nComp <- 3

# simulate from gamma distributions with
# varying amounts of skewness:
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
#Define a 'true' W (uses the estimated whitening matrix):
W.true <- solve(simM%*%xWhitened$whitener)

estInfomax <- infomaxICA(X = xData, n.comp = nComp, whiten = TRUE, verbose = TRUE)

frobICA(estInfomax$M,simM)
library(JADE)
MD(t(estInfomax$W),t(solve(W.true)))
amari.error(t(estInfomax$W),t(solve(W.true)))



