library(senstrat)


### Name: senstrat
### Title: Sensitivity Analysis With Strata.
### Aliases: senstrat
### Keywords: htest robust

### ** Examples

data("homocyst")
attach(homocyst)
sc<-hodgeslehmann(log2(homocysteine),z,stf,align="hl")
senstrat(sc,z,stf,gamma=1.8)
# Compare this with:
senstrat(sc,z,stf,gamma=1.8,detail=TRUE)
# With detail=TRUE, it is seen that the separable and Taylor bounds
# on the maximum P-value are nearly identical.  The Taylor upper bound
# is safe -- i.e., at worst conservative -- in all cases.
detach(homocyst)
#
# The following example compares senmw in the sensitivitymw package
# to senstrat in an example with 397 matched triples, one treated,
# two controls.  We expect the separable approximation to work well
# with S=397 small strata, and indeed the results are identical.
library(sensitivitymw)
data(mercury)
senmw(mercury,gamma=15)
# Reformat mercury for use by senstrat().
z<-c(rep(1,397),rep(0,397),rep(0,397))
st<-rep(1:397,3)
y<-as.vector(as.matrix(mercury))
sc<-mscores(y,z,st=st)
senstrat(sc,z,st,gamma=15,detail=TRUE)
# The separable approximation from senmw() and senstrat() are identical,
# as they should be, and the Taylor approximation in senstrat()
# makes no adjustment to the separable approximation.
#
# The following example from the sensitivitymw package
# is for 39 matched pairs, so the separable algorithm
# and the Taylor approximation are not needed, yet
# they both provide exactly the correct answer.
library(sensitivitymw)
data(erpcp)
senmw(erpcp,gamma=3)
# Reformat erpcp for use by senstrat().
z<-c(rep(1,39),rep(0,39))
st<-rep(1:39,2)
y<-as.vector(as.matrix(erpcp))
sc<-mscores(y,z,st=st)
senstrat(sc,z,st,gamma=3,detail=TRUE)



