library(QDComparison)


### Name: LP.QDC
### Title: The main function for two-sample quantile and distribution
###   comparison
### Aliases: LP.QDC
### Keywords: Main Function

### ** Examples

x <- c(rep(0,200),rep(1,200))
y <- c(rnorm(200,0,1),rnorm(200,1,1))
L <- LP.QDC(x,y)
L$pval



