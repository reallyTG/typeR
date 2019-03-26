## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
alpha = rep(0.25, 4)  ## equal

p1 = 0.85
p2 = 0.1
p3 = 0.2
P = matrix(c(
  p1,p2,p2,p2,
  p1,p3,p3,p3,
  p2,p1,p2,p2,
  p3,p1,p3,p3,
  p2,p2,p1,p2,
  p3,p3,p1,p3,
  p2,p2,p2,p1,
  p3,p3,p3,p1), nrow=8, ncol=4, byrow = TRUE)

## ------------------------------------------------------------------------
simLCA <- function(alpha, ProbMat, sampleSize, nsim) {
  
  ## Reformat the probability Matrix to a form required by poLCA.simdata
  probs = vector("list", nrow(ProbMat))
  for (i in 1:nrow(ProbMat)) {
    probs[[i]] = cbind(ProbMat[i,], 1 - ProbMat[i,])
  }

  X = poLCA.simdata(N = sampleSize*nsim, probs = probs, P = alpha)$dat
  split(X, rep(1:nsim, each=sampleSize))
}

## ------------------------------------------------------------------------
library(poLCA)
set.seed(37421)
X = simLCA(alpha, P, sampleSize=50, nsim=1)[[1]]
head(X)

## ------------------------------------------------------------------------
f = cbind(Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8) ~ 1
poLCA(f, X, nclass = 3, verbose=FALSE)

## ------------------------------------------------------------------------
library(sBIC)
lcas = LCAs(maxNumClasses=6, numVariables=8, numStatesForVariables=2)
results = sBIC(X, lcas)

## ------------------------------------------------------------------------
phivec = (6:10)/2

## ---- fig.cap="Influence of penalty parameter phi on sBIC for LCA"-------
plot(1:6, results$sBIC - max(results$sBIC), type="n", xlab="number of latent classes", 
     ylab=expression(bar(SBIC)[phi]))

for (i in seq_along(phivec)) {
    setPhi(lcas, phivec[i])
    results = sBIC(NULL, lcas)
    lines(1:6, results$sBIC - max(results$sBIC), pch=i, lty=i, type="b")
}
legend("topleft", pch=1:6, lty=1:6, legend=paste("phi=", phivec))

## ------------------------------------------------------------------------
fitBIC <- function(X, maxNumClasses, phis) {

    lcas = LCAs(maxNumClasses, numVariables=ncol(X), numStatesForVariables=2)
    results = sBIC(X, lcas)
    
    nclass.bic <- which.max(results$BIC)
    nclass.sbic = numeric(length(phis))
    for (k in seq_along(phis)) {
       lcas$setPhi(phis[k])
       results = sBIC(NULL, lcas)
       nclass.sbic[k] = which.max(results$sBIC)
    }
    c(nclass.bic, nclass.sbic)
}

## ------------------------------------------------------------------------
createTable = function(Xlist, ...) {
  
  ## Set up cluster
  cl <- makeCluster(detectCores() - 1)
  clusterEvalQ(cl, library(sBIC))
  clusterEvalQ(cl, library(poLCA))
  clusterSetRNGStream(cl)

  ## Fit LCA models to simulated data and tabulate 
  bicResults = parSapply(cl, Xlist, fitBIC, ...)
  bicTab = apply(bicResults, 1, tabulate, nbin=maxNumClasses)
  dimnames(bicTab) = list(1:maxNumClasses, c("BIC", paste0("sBIC", phis)))
  
  ## End cluster
  stopCluster(cl)
  
  bicTab
}

## ---- eval=FALSE---------------------------------------------------------
#  library(parallel)
#  set.seed(1234)
#  Xlist = simLCA(alpha, Pr, sampleSize=50, nsim=100)
#  bictab = createTable(Xlist, maxNumClasses=6, phis=phivec)
#  knitr::kable(bictab, row.names=TRUE)

