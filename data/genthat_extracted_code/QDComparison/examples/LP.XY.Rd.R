library(QDComparison)


### Name: LP.XY
### Title: A function to compute LP comeans, LP Fourier coefficients,
###   LPINFOR test statistic, and a p-value of distribution equality
### Aliases: LP.XY
### Keywords: Helper Functions

### ** Examples

x <- c(rep(0,200),rep(1,200))
y <- c(rnorm(200,0,1),rnorm(200,1,1))
L <- LP.XY(x,y)
L$pval



