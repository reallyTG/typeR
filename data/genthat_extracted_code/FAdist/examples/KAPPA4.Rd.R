library(FAdist)


### Name: KAPPA4
### Title: Four-Parameter Kappa Distribution
### Aliases: dkappa4 pkappa4 qkappa4 rkappa4
### Keywords: distribution

### ** Examples

x <- rkappa4(1000,.1,.2,12,110)
hist(x,freq=FALSE,col='gray',border='white')
curve(dkappa4(x,.1,.2,12,110),add=TRUE,col='red4',lwd=2)



