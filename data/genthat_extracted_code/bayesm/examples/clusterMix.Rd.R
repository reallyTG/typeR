library(bayesm)


### Name: clusterMix
### Title: Cluster Observations Based on Indicator MCMC Draws
### Aliases: clusterMix
### Keywords: models multivariate

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {

  ## simulate data from mixture of normals
  n = 500
  pvec = c(.5,.5)
  mu1 = c(2,2)
  mu2 = c(-2,-2)
  Sigma1 = matrix(c(1,0.5,0.5,1), ncol=2)
  Sigma2 = matrix(c(1,0.5,0.5,1), ncol=2)
  comps = NULL
  comps[[1]] = list(mu1, backsolve(chol(Sigma1),diag(2)))
  comps[[2]] = list(mu2, backsolve(chol(Sigma2),diag(2)))
  dm = rmixture(n, pvec, comps)
  
  ## run MCMC on normal mixture
  Data = list(y=dm$x)
  ncomp = 2
  Prior = list(ncomp=ncomp, a=c(rep(100,ncomp)))
  R = 2000
  Mcmc = list(R=R, keep=1)
  out = rnmixGibbs(Data=Data, Prior=Prior, Mcmc=Mcmc)
  
  ## find clusters
  begin = 500
  end = R
  outclusterMix = clusterMix(out$nmix$zdraw[begin:end,])
  
  
  ## check on clustering versus "truth"
  ## note: there could be switched labels
  table(outclusterMix$clustera, dm$z)
  table(outclusterMix$clusterb, dm$z)
}



