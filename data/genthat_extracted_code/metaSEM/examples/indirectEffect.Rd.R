library(metaSEM)


### Name: indirectEffect
### Title: Estimate the asymptotic covariance matrix of standardized or
###   unstandardized indirect and direct effects
### Aliases: indirectEffect
### Keywords: compute effect sizes

### ** Examples

## A correlation matrix as input
x <- matrix(c(1, 0.4, 0.2, 0.4, 1, 0.3, 0.2, 0.3, 1), ncol=3)
dimnames(x) <- list( c("y", "m", "x"), c("y", "m", "x") )
indirectEffect(x, n=300)

## A list of correlation matrices
indirectEffect( list(x, x), n=c(300,500), standardized=FALSE )



