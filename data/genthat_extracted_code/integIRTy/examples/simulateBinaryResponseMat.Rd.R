library(integIRTy)


### Name: simulateBinaryResponseMat
### Title: Simulate binary response matrix according to 2-parameter Item
###   Characteristic Function for given latent traits and item parameters.
### Aliases: simulateBinaryResponseMat
### Keywords: ~kwd1 ~kwd2

### ** Examples

# number of samples and genes to simulate
nSample <- 50
nGene <- 1000
# mean and variance of item parameters
meanDffclt_Expr <- 3; varDffclt_Expr <- 0.2
meanDscrmn_Expr <- 1.5; varDscrmn_Expr <- 0.1
# generate item parameters from gamma distribution
set.seed(1000)
Dffclt_Expr <-  rgamma(nSample, shape=meanDffclt_Expr^2/varDffclt_Expr,
                      scale=varDffclt_Expr/meanDffclt_Expr)
Dscrmn_Expr <-  rgamma(nSample, shape=meanDscrmn_Expr^2/varDscrmn_Expr,
                      scale=varDscrmn_Expr/meanDscrmn_Expr)
# generate latent trait
theta <- rnorm(nGene)
# the binary response matrix
binary_Expr <- simulateBinaryResponseMat(a=Dscrmn_Expr, b=Dffclt_Expr, theta=theta)
dim(binary_Expr)



