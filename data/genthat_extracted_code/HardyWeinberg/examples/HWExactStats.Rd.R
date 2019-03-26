library(HardyWeinberg)


### Name: HWExactStats
### Title: Computation of Exact p-values for Hardy-Weinberg equilibrium for
###   sets of SNPs
### Aliases: HWExactStats
### Keywords: htest

### ** Examples

#
# Autosomal example
#
set.seed(123)
X <- HWData(1000,100)
monom <- (X[,2]==0 & X[,1]==0) | (X[,2]==0 & X[,3]==0)
X <- X[!monom,] # exclude monomorphics
Exact.pvalues <- HWExactStats(X,x.linked=FALSE)
#
# X-chromosomal example
#
X <- HWData(1000,100,n.males=50,nA=75,x.linked=TRUE)
Exact.pvalues <- HWExactStats(X,x.linked=TRUE)



