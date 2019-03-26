library(CDVine)


### Name: CDVineSeqEst
### Title: Sequential estimation of C- and D-vine copula models
### Aliases: CDVineSeqEst

### ** Examples

## Example 1: 4-dimensional D-vine model with Gaussian pair-copulas
data(worldindices)
Data = as.matrix(worldindices)[,1:4]
d = dim(Data)[2]
fam = rep(1,d*(d-1)/2)

# sequential estimation 
CDVineSeqEst(Data,fam,type=2,method="itau")$par
CDVineSeqEst(Data,fam,type=2,method="mle")$par


## Example 2: 4-dimensional D-vine model with mixed pair-copulas
fam2 = c(5,1,3,14,3,2)

# sequential estimation
CDVineSeqEst(Data,fam2,type=2,method="mle",se=TRUE,progress=TRUE)



