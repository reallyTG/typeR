library(BSagri)


### Name: CInp
### Title: Construct local confidence intervals from joint empirical
###   distribution.
### Aliases: CInp CInp.default CInp.CCRatio CInp.CCDiff CInp.bugs
### Keywords: htest

### ** Examples


# Assume a 100 times 4 matrix of 4 mutually independent
# normal variables:

X<-cbind(rnorm(100), rnorm(100), rnorm(100), rnorm(100))

lcits<-CInp(x=X, conf.level=0.95, alternative="two.sided")
lcits

ci1<-lcits$conf.int[1,]
length( which(X[,1]>=ci1[1] & X[,1]<=ci1[2] ) )


ci2<-lcits$conf.int[2,]
length( which(X[,2]>=ci2[1] & X[,2]<=ci2[2] ) )





