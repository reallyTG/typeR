library(ash)


### Name: ash1
### Title: univariate ASH
### Aliases: ash1
### Keywords: nonparametric

### ** Examples

x <- rnorm(100)         # data
f <- ash1(bin1(x,nbin=50),5) # compute ash estimate
plot( f , type="l" )    # line plot of estimate



