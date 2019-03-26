library(rqPen)


### Name: qaSIS
### Title: Quantile Adaptive Sure Independence Screening
### Aliases: qaSIS

### ** Examples

x <- pnorm(matrix(rnorm(800),nrow=100))
y <- 1 + 2*cos(2*pi*x[,1])+exp(2*x[,2]) + rnorm(100,sd=.1)
var_ranks <- qaSIS(x,y)



