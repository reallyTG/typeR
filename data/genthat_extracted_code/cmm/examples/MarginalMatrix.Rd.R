library(cmm)


### Name: MarginalMatrix
### Title: MarginalMatrix
### Aliases: MarginalMatrix
### Keywords: univar

### ** Examples

# Computing marginal frequencies
n <- c(1:6)  #example list of frequencies
var <- c("A","B")
marg <- list(c("A"),c("B"))
dim <- c(2,3)
at <- MarginalMatrix(var,marg,dim)
# list of marginal frequencies:
at 

# identitymatrix: several ways of specifying:
marg <- c("A","B")
MarginalMatrix(var, marg,dim)
MarginalMatrix(var, marg, dim,
 SubsetCoding = list(c("A", "B"), list("Identity", "Identity")))
MarginalMatrix(var, marg, dim,
 SubsetCoding = list(c("A","B"), list(rbind(c(1,0),c(0,1)), rbind(c(1,0,0),c(0,1,0),c(0,0,1)))))

# omit second category of first variable
at <- MarginalMatrix(var, marg, dim,
 SubsetCoding = list(c("A","B"), list(rbind(c(1,0)),"Identity")))
at 



