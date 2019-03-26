library(FAdist)


### Name: KAPPA
### Title: Kappa Distribution
### Aliases: dkappa pkappa qkappa rkappa
### Keywords: distribution

### ** Examples

x <- rkappa(1000,12,10)
hist(x,freq=FALSE,col='gray',border='white')
curve(dkappa(x,12,10),add=TRUE,col='red4',lwd=2)



