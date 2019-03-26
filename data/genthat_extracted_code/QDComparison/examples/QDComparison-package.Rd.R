library(QDComparison)


### Name: QDComparison-package
### Title: Modern Nonparametric Tools for Two-Sample Quantile and
###   Distribution Comparisons
### Aliases: QDComparison-package QDComparison
### Keywords: package

### ** Examples

x <- c(rep(0,200),rep(1,200))
y <- c(rnorm(200,0,1),rnorm(200,1,1))
L <- LP.QDC(x,y)
L$pval



