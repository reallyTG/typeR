library(portes)


### Name: ToeplitzBlock
### Title: Toeplitz Block Matrix of Hosking (1980) Auto and Cross
###   Correlation Matrices
### Aliases: ToeplitzBlock
### Keywords: Array

### ** Examples

x <- rnorm(100)   
ToeplitzBlock(x,lag.max=4)          ## Univariate Series
#
y <- cbind(rnorm(100),rnorm(100)) 
ToeplitzBlock(y,lag.max=4)          ## Multivariate Series
#
ToeplitzBlock(y,lag.max=4,season=4) ## Multivariate Series



