library(LS2Wstat)


### Name: avespecvar
### Title: A test statistic for spatial stationarity.
### Aliases: avespecvar
### Keywords: nonparametric

### ** Examples

#Generate a cddews object
#
X <- Haar2MA.diag(64)

testspec<-cddews(X,smooth=FALSE)

#Find the value of the test statistic
#
avespecvar(testspec)
#



