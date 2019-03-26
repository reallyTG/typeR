library(bayesm)


### Name: rhierMnlRwMixture
### Title: MCMC Algorithm for Hierarchical Multinomial Logit with
###   Mixture-of-Normals Heterogeneity
### Aliases: rhierMnlRwMixture
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=10000} else {R=10}
set.seed(66)

p = 3                                # num of choice alterns
ncoef = 3  
nlgt = 300                           # num of cross sectional units
nz = 2
Z = matrix(runif(nz*nlgt),ncol=nz)
Z = t(t(Z) - apply(Z,2,mean))        # demean Z
ncomp = 3                            # num of mixture components
Delta = matrix(c(1,0,1,0,1,2),ncol=2)

comps=NULL
comps[[1]] = list(mu=c(0,-1,-2),   rooti=diag(rep(1,3)))
comps[[2]] = list(mu=c(0,-1,-2)*2, rooti=diag(rep(1,3)))
comps[[3]] = list(mu=c(0,-1,-2)*4, rooti=diag(rep(1,3)))
pvec = c(0.4, 0.2, 0.4)

##  simulate from MNL model conditional on X matrix
simmnlwX= function(n,X,beta) {
  k = length(beta)
  Xbeta = X%*%beta
  j = nrow(Xbeta) / n
  Xbeta = matrix(Xbeta, byrow=TRUE, ncol=j)
  Prob = exp(Xbeta)
  iota = c(rep(1,j))
  denom = Prob%*%iota
  Prob = Prob/as.vector(denom)
  y = vector("double",n)
  ind = 1:j
  for (i in 1:n) { 
    yvec = rmultinom(1, 1, Prob[i,])
    y[i] = ind%*%yvec
  }
  return(list(y=y, X=X, beta=beta, prob=Prob))
}

## simulate data
simlgtdata = NULL
ni = rep(50, 300)
for (i in 1:nlgt) {
  betai = Delta%*%Z[i,] + as.vector(rmixture(1,pvec,comps)$x)
   Xa = matrix(runif(ni[i]*p,min=-1.5,max=0), ncol=p)
   X = createX(p, na=1, nd=NULL, Xa=Xa, Xd=NULL, base=1)
   outa = simmnlwX(ni[i], X, betai)
   simlgtdata[[i]] = list(y=outa$y, X=X, beta=betai)
}

## plot betas
if(0){
  bmat = matrix(0, nlgt, ncoef)
  for(i in 1:nlgt) {bmat[i,] = simlgtdata[[i]]$beta}
  par(mfrow = c(ncoef,1))
  for(i in 1:ncoef) { hist(bmat[,i], breaks=30, col="magenta") }
}

## set parms for priors and Z
Prior1 = list(ncomp=5)
keep = 5
Mcmc1 = list(R=R, keep=keep)
Data1 = list(p=p, lgtdata=simlgtdata, Z=Z)

## fit model without sign constraints
out1 = rhierMnlRwMixture(Data=Data1, Prior=Prior1, Mcmc=Mcmc1)

cat("Summary of Delta draws", fill=TRUE)
summary(out1$Deltadraw, tvalues=as.vector(Delta))

cat("Summary of Normal Mixture Distribution", fill=TRUE)
summary(out1$nmix)

## plotting examples
if(0) {
  plot(out1$betadraw)
  plot(out1$nmix)
}

## fit model with constraint that beta_i2 < 0 forall i
Prior2 = list(ncomp=5, SignRes=c(0,-1,0))
out2 = rhierMnlRwMixture(Data=Data1, Prior=Prior2, Mcmc=Mcmc1)

cat("Summary of Delta draws", fill=TRUE)
summary(out2$Deltadraw, tvalues=as.vector(Delta))

cat("Summary of Normal Mixture Distribution", fill=TRUE)
summary(out2$nmix)

## plotting examples
if(0) {
  plot(out2$betadraw)
  plot(out2$nmix)
}



