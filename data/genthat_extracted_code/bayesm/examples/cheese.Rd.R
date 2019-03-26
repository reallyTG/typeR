library(bayesm)


### Name: cheese
### Title: Sliced Cheese Data
### Aliases: cheese
### Keywords: datasets

### ** Examples

data(cheese)
cat(" Quantiles of the Variables ",fill=TRUE)
mat = apply(as.matrix(cheese[,2:4]), 2, quantile)
print(mat)


## example of processing for use with rhierLinearModel
if(0) {
  retailer = levels(cheese$RETAILER)
  nreg = length(retailer)
  nvar = 3
  regdata = NULL
  for (reg in 1:nreg) {
    y = log(cheese$VOLUME[cheese$RETAILER==retailer[reg]])
    iota = c(rep(1,length(y)))
    X = cbind(iota, cheese$DISP[cheese$RETAILER==retailer[reg]],
      log(cheese$PRICE[cheese$RETAILER==retailer[reg]]))
    regdata[[reg]] = list(y=y, X=X)
  }
  Z = matrix(c(rep(1,nreg)), ncol=1)
  nz = ncol(Z)
  
  
  ## run each individual regression and store results
  lscoef = matrix(double(nreg*nvar), ncol=nvar)
  for (reg in 1:nreg) {
    coef = lsfit(regdata[[reg]]$X, regdata[[reg]]$y, intercept=FALSE)$coef
    if (var(regdata[[reg]]$X[,2])==0) {
      lscoef[reg,1]=coef[1] 
      lscoef[reg,3]=coef[2]
    }
    else {lscoef[reg,]=coef}
  }
  
  R = 2000
  Data = list(regdata=regdata, Z=Z)
  Mcmc = list(R=R, keep=1)
  
  set.seed(66)
  out = rhierLinearModel(Data=Data, Mcmc=Mcmc)
  
  cat("Summary of Delta Draws", fill=TRUE)
  summary(out$Deltadraw)
  cat("Summary of Vbeta Draws", fill=TRUE)
  summary(out$Vbetadraw)
  
  # plot hier coefs
  if(0) {plot(out$betadraw)}
}



