library(LaplacesDemon)


### Name: Blocks
### Title: Blocks
### Aliases: Blocks
### Keywords: MCMC Multicollinearity Posterior Correlation Utility

### ** Examples

library(LaplacesDemon)

### Create the default number of sequentially assigned blocks:
Initial.Values <- rep(0,1000)
MyBlocks <- Blocks(Initial.Values)
MyBlocks

### Or, a pre-specified number of sequentially assigned blocks:
#Initial.Values <- rep(0,1000)
#MyBlocks <- Blocks(Initial.Values, N=20)

### If scaled diagonal covariance matrices are desired:
#VarCov <- list()
#for (i in 1:length(MyBlocks))
#  VarCov[[i]] <- diag(length(MyBlocks[[i]]))*2.38^2/length(MyBlocks[[i]])

### Or, determine the number of blocks in the range of 2 to 50 from
### hierarchical clustering on the posterior correlation matrix of an
### object, say called Fit, output from LaplacesDemon:
#MyBlocks <- Blocks(Initial.Values, N=c(2,50),
#  PostCor=cor(Fit$Posterior1))
#lapply(MyBlocks, length) #See the number of parameters per block

### Or, create a pre-specified number of blocks from hierarchical
### clustering on the posterior correlation matrix of an object,
### say called Fit, output from LaplacesDemon:
#MyBlocks <- Blocks(Initial.Values, N=20, PostCor=cor(Fit$Posterior1))

### Posterior correlation from a previous trial run could be obtained
### with either method below (though cor() will be fastest because
### additional checks are not calculated for the parameters):
#rho <- cor(Fit$Posterior1)
#rho <- PosteriorChecks(Fit)$Posterior.Correlation



