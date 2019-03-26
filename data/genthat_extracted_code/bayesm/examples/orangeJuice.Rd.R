library(bayesm)


### Name: orangeJuice
### Title: Store-level Panel Data on Orange Juice Sales
### Aliases: orangeJuice
### Keywords: datasets

### ** Examples

## load data
data(orangeJuice)

## print some quantiles of yx data  
cat("Quantiles of the Variables in yx data",fill=TRUE)
mat = apply(as.matrix(orangeJuice$yx), 2, quantile)
print(mat)

## print some quantiles of storedemo data
cat("Quantiles of the Variables in storedemo data",fill=TRUE)
mat = apply(as.matrix(orangeJuice$storedemo), 2, quantile)
print(mat)


## processing for use with rhierLinearModel
if(0) {
  
  ## select brand 1 for analysis
  brand1 = orangeJuice$yx[(orangeJuice$yx$brand==1),]
  
  store = sort(unique(brand1$store))
  nreg = length(store)
  nvar = 14
  
  regdata=NULL
  for (reg in 1:nreg) {
    y = brand1$logmove[brand1$store==store[reg]]
    iota = c(rep(1,length(y)))
    X = cbind(iota,log(brand1$price1[brand1$store==store[reg]]),
                   log(brand1$price2[brand1$store==store[reg]]),
                   log(brand1$price3[brand1$store==store[reg]]),
                   log(brand1$price4[brand1$store==store[reg]]),
                   log(brand1$price5[brand1$store==store[reg]]),
                   log(brand1$price6[brand1$store==store[reg]]),
                   log(brand1$price7[brand1$store==store[reg]]),
                   log(brand1$price8[brand1$store==store[reg]]),
                   log(brand1$price9[brand1$store==store[reg]]),
                   log(brand1$price10[brand1$store==store[reg]]),
                   log(brand1$price11[brand1$store==store[reg]]),
                   brand1$deal[brand1$store==store[reg]],
                   brand1$feat[brand1$store==store[reg]] )
    regdata[[reg]] = list(y=y, X=X)
    }
  
  ## storedemo is standardized to zero mean.
  Z = as.matrix(orangeJuice$storedemo[,2:12]) 
  dmean = apply(Z, 2, mean)
  for (s in 1:nreg) {Z[s,] = Z[s,] - dmean}
  iotaz = c(rep(1,nrow(Z)))
  Z = cbind(iotaz, Z)
  nz = ncol(Z)
  
  Data = list(regdata=regdata, Z=Z)
  Mcmc = list(R=R, keep=1)
  
  out = rhierLinearModel(Data=Data, Mcmc=Mcmc)
  
  summary(out$Deltadraw)
  summary(out$Vbetadraw)
  
  ## plotting examples
  if(0){ plot(out$betadraw) }
}



