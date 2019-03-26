library(bayesm)


### Name: tuna
### Title: Canned Tuna Sales Data
### Aliases: tuna
### Keywords: datasets

### ** Examples

data(tuna)
cat(" Quantiles of sales", fill=TRUE)
mat = apply(as.matrix(tuna[,2:5]), 2, quantile)
print(mat)


## example of processing for use with rivGibbs
if(0) {
  data(tuna)                          
  t = dim(tuna)[1]    
  customers = tuna[,30]                 
  sales = tuna[,2:8]                                                        
  lnprice = tuna[,16:22]      
  lnwhPrice = tuna[,23:29]      
  share = sales/mean(customers)
  shareout = as.vector(1-rowSums(share))
  lnprob = log(share/shareout)  

  ## create w matrix
  I1 = as.matrix(rep(1,t))
  I0 = as.matrix(rep(0,t))
  intercept = rep(I1,4)
  brand1 = rbind(I1, I0, I0, I0)
  brand2 = rbind(I0, I1, I0, I0)
  brand3 = rbind(I0, I0, I1, I0)
  w = cbind(intercept, brand1, brand2, brand3)  
  
  ## choose brand 1 to 4
  y = as.vector(as.matrix(lnprob[,1:4]))
  X = as.vector(as.matrix(lnprice[,1:4]))
  lnwhPrice = as.vector(as.matrix(lnwhPrice[1:4]))
  z = cbind(w, lnwhPrice)
                        
  Data = list(z=z, w=w, x=X, y=y)
  Mcmc = list(R=R, keep=1)
  
  set.seed(66)
  out = rivGibbs(Data=Data, Mcmc=Mcmc)

  cat(" betadraws ", fill=TRUE)
  summary(out$betadraw)

  ## plotting examples
  if(0){plot(out$betadraw)}
}



