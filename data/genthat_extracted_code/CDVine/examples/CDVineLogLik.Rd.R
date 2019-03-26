library(CDVine)


### Name: CDVineLogLik
### Title: Log-likelihood of C- and D-vine copula models
### Aliases: CDVineLogLik

### ** Examples

## Example 1: 3-dimensional D-vine model with Gaussian pair-copulas
data(worldindices)
Data = as.matrix(worldindices)[,1:3]
fam1 = c(1,1,1) 
par1 = c(0.2,0.3,0.4)

# calculate the log-likelihood
logLik1 = CDVineLogLik(Data,fam1,par1,type=2)

# check the above formula
sum(logLik1$ll)
logLik1$loglik


## Example 2: 6-dimensional C-vine model with Student t pair-copulas
## with 5 degrees of freedom
data(worldindices)
Data = as.matrix(worldindices)
dd = dim(Data)[2]*(dim(Data)[2]-1)/2
fam2 = rep(2,dd)
par2 = rep(0.5,dd)
nu2 = rep(5,dd)

# calculate the log-likelihood
logLik2 = CDVineLogLik(Data,fam2,par2,nu2,type=1)
logLik2$loglik


## Example 3: 4-dimensional C-vine model with mixed pair-copulas
fam3 = c(5,1,3,14,3,2)
par3 = c(0.9,0.3,0.2,1.1,0.2,0.7)
nu3 = c(0,0,0,0,0,7)

# calculate the log-likelihood
logLik3 = CDVineLogLik(Data[,1:4],fam3,par3,nu3,type=2)
logLik3$loglik



