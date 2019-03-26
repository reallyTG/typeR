library(CDVine)


### Name: CDVineMLE
### Title: Maximum likelihood estimation of C- and D-vine copula models
### Aliases: CDVineMLE

### ** Examples

## Example 1: 4-dimensional D-vine model with Gaussian pair-copulas
data(worldindices)
Data = as.matrix(worldindices)[,1:4]
fam = rep(1,6)

# maximum likelihood estimation
## Not run: 
##D CDVineMLE(Data,family=fam,type=2,maxit=100)
## End(Not run)

## Example 2: 4-dimensional D-vine model with mixed pair-copulas
fam2 = c(5,1,3,14,3,2)

# sequential estimation
m = CDVineSeqEst(Data,family=fam2,type=2)
m

# calculate the log-likelihood
LogLik0 = CDVineLogLik(Data,fam2,m$par,m$par2,type=2)
LogLik0$loglik

# maximum likelihood estimation
## Not run: 
##D CDVineMLE(Data,family=fam2,type=2,maxit=5)  # 5 iterations
##D CDVineMLE(Data,family=fam2,type=2)  # default: 200 iterations
## End(Not run)



