library(gammSlice)


### Name: plot.gSlc
### Title: Plot smooth function components of 'gSlc()' fits
### Aliases: plot.gSlc

### ** Examples

library(gammSlice)
set.seed(53902)
n <- 400 ; x <- runif(n)
fTrue <- function(x) return(cos(4*pi*x) + 2*x - 1)
mu <- exp(fTrue(x)) ; y <- rpois(n,mu)
fit <- gSlc(y~s(x),family="poisson",control=gSlc.control(nBurn=200,nKept=200,nThin=1,msgCode=0))
plot(fit)
plot(fit,responseScale=TRUE,rug=FALSE)
points(x,y,col="dodgerblue")



