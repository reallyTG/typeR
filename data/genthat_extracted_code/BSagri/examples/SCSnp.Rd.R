library(BSagri)


### Name: SCSnp
### Title: Simultaneous confidence sets from empirical joint distribution.
### Aliases: SCSnp SCSnp.default SCSnp.CCDiff SCSnp.CCRatio SCSnp.bugs
### Keywords: htest

### ** Examples



# Assume a 1000 times 4 matrix of 4 mutually independent
# normal variables:

X<-cbind(rnorm(1000), rnorm(1000), rnorm(1000), rnorm(1000))

SCSts<-SCSnp(x=X, conf.level=0.9, alternative="two.sided")
SCSts

SCS<-SCSts$conf.int

in1<-X[,1]>=SCS[1,1] & X[,1]<=SCS[1,2] 

in2<-X[,2]>=SCS[2,1] & X[,2]<=SCS[2,2] 

in3<-X[,3]>=SCS[3,1] & X[,3]<=SCS[3,2] 

in4<-X[,4]>=SCS[4,1] & X[,4]<=SCS[4,2] 

sum(in1*in2*in3*in4)





