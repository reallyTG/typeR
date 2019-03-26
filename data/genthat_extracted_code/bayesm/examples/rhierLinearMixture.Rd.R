library(bayesm)


### Name: rhierLinearMixture
### Title: Gibbs Sampler for Hierarchical Linear Model with
###   Mixture-of-Normals Heterogeneity
### Aliases: rhierLinearMixture
### Keywords: regression

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=2000} else {R=10}
set.seed(66)

nreg = 300
nobs = 500
nvar = 3
nz = 2

Z = matrix(runif(nreg*nz), ncol=nz) 
Z = t(t(Z) - apply(Z,2,mean))
Delta = matrix(c(1,-1,2,0,1,0), ncol=nz)
tau0 = 0.1
iota = c(rep(1,nobs))

## create arguments for rmixture

tcomps = NULL
a = matrix(c(1,0,0,0.5773503,1.1547005,0,-0.4082483,0.4082483,1.2247449), ncol=3)
tcomps[[1]] = list(mu=c(0,-1,-2),   rooti=a) 
tcomps[[2]] = list(mu=c(0,-1,-2)*2, rooti=a)
tcomps[[3]] = list(mu=c(0,-1,-2)*4, rooti=a)
tpvec = c(0.4, 0.2, 0.4)

## simulated data with Z
regdata = NULL
betas = matrix(double(nreg*nvar), ncol=nvar)
tind = double(nreg)

for (reg in 1:nreg) {
  tempout = rmixture(1,tpvec,tcomps)
  betas[reg,] = Delta%*%Z[reg,] + as.vector(tempout$x)
  tind[reg] = tempout$z
  X = cbind(iota, matrix(runif(nobs*(nvar-1)),ncol=(nvar-1)))
  tau = tau0*runif(1,min=0.5,max=1)
  y = X%*%betas[reg,] + sqrt(tau)*rnorm(nobs)
  regdata[[reg]] = list(y=y, X=X, beta=betas[reg,], tau=tau)
}

## run rhierLinearMixture

Data1 = list(regdata=regdata, Z=Z)
Prior1 = list(ncomp=3)
Mcmc1 = list(R=R, keep=1)

out1 = rhierLinearMixture(Data=Data1, Prior=Prior1, Mcmc=Mcmc1)

cat("Summary of Delta draws", fill=TRUE)
summary(out1$Deltadraw, tvalues=as.vector(Delta))

cat("Summary of Normal Mixture Distribution", fill=TRUE)
summary(out1$nmix)

## plotting examples
if(0){
  plot(out1$betadraw)
  plot(out1$nmix)
  plot(out1$Deltadraw)
}



