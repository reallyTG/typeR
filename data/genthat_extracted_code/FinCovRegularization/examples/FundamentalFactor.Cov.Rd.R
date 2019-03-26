library(FinCovRegularization)


### Name: FundamentalFactor.Cov
### Title: Covariance Matrix Estimation by Fundamental Factor Model
### Aliases: FundamentalFactor.Cov

### ** Examples

data(m.excess.c10sp9003)
assets <- m.excess.c10sp9003[,1:10]
Indicator <- matrix(0,10,3)
dimnames(Indicator) <- list(colnames(assets),c("Drug","Auto","Oil"))
Indicator[c("ABT","LLY","MRK","PFE"),"Drug"] <- 1
Indicator[c("F","GM"),"Auto"] <- 1
Indicator[c("BP","CVX","RD","XOM"),"Oil"] <- 1
FundamentalFactor.Cov(assets,exposure=Indicator,method="WLS")



