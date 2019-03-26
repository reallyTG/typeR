library(BSagri)


### Name: CCRatio.default
### Title: Compute ratio contrasts of chains of joint empirical
###   distributions.
### Aliases: CCRatio.default
### Keywords: internal

### ** Examples



X<-round(cbind(
 rnorm(10,1,1),
 rnorm(10,1,1),
 rnorm(10,1,1),
 rnorm(10,1,1)))

# and numerator and denominator
# x times 4 contrast matrix

NMAT<-rbind(
c(1,0,0,0),
c(1,0,0,0),
c(1,0,0,0)
)


DMAT<-rbind(
c(0,1,0,0),
c(0,0,1,0),
c(0,0,0,1)
)


CCRatio.default(x=X, cmat=list(numC=NMAT, denC=DMAT) )





