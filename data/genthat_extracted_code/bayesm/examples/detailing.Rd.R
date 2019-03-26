library(bayesm)


### Name: detailing
### Title: Physician Detailing Data
### Aliases: detailing
### Keywords: datasets

### ** Examples

data(detailing)

cat(" table of Counts Dep Var", fill=TRUE)
print(table(detailing$counts[,2]))

cat(" means of Demographic Variables",fill=TRUE)
mat = apply(as.matrix(detailing$demo[,2:4]), 2, mean)
print(mat)


## example of processing for use with 'rhierNegbinRw'
if(0) {
  data(detailing)
  counts = detailing$counts
  Z = detailing$demo
  
  # Construct the Z matrix
  Z[,1] = 1
  Z[,2] = Z[,2] - mean(Z[,2])
  Z[,3] = Z[,3] - mean(Z[,3])
  Z[,4] = Z[,4] - mean(Z[,4])
  Z = as.matrix(Z)
  id = levels(factor(counts$id))
  nreg = length(id)
  nobs = nrow(counts$id)
  
  regdata = NULL
  for (i in 1:nreg) {
    X = counts[counts[,1] == id[i], c(3:4)]
    X = cbind(rep(1, nrow(X)), X)
    y = counts[counts[,1] == id[i], 2]
    X = as.matrix(X)
    regdata[[i]] = list(X=X, y=y)
  }
  rm(detailing, counts)              
  cat("Finished reading data", fill=TRUE)
  fsh()
  Data = list(regdata=regdata, Z=Z)
  
  nvar = ncol(X)            # Number of X variables
  nz = ncol(Z)              # Number of Z variables
  deltabar = matrix(rep(0,nvar*nz), nrow=nz)
  Vdelta = 0.01*diag(nz)
  nu = nvar+3
  V = 0.01*diag(nvar)
  a = 0.5
  b = 0.1
  Prior = list(deltabar=deltabar, Vdelta=Vdelta, nu=nu, V=V, a=a, b=b)
  
  R = 10000
  keep = 1
  s_beta = 2.93/sqrt(nvar)
  s_alpha = 2.93
  c = 2
  Mcmc = list(R=R, keep=keep, s_beta=s_beta, s_alpha=s_alpha, c=c)
  
  out = rhierNegbinRw(Data, Prior, Mcmc)
  
  ## Unit level mean beta parameters
  Mbeta = matrix(rep(0,nreg*nvar), nrow=nreg)
  ndraws = length(out$alphadraw)
  for (i in 1:nreg) { Mbeta[i,] = rowSums(out$Betadraw[i,,])/ndraws }
  
  cat(" Deltadraws ", fill=TRUE)
  summary(out$Deltadraw)
  cat(" Vbetadraws ", fill=TRUE)
  summary(out$Vbetadraw)
  cat(" alphadraws ", fill=TRUE)
  summary(out$alphadraw)
  
  ## plotting examples
  if(0){
    plot(out$betadraw)
    plot(out$alphadraw)
    plot(out$Deltadraw)
  }
}




