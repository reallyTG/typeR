library(mbbefd)


### Name: mbbefd-distr
### Title: The MBBEFD distribution (two parametrizations)
### Aliases: mbbefd-distr dmbbefd pmbbefd qmbbefd rmbbefd ecmbbefd mmbbefd
###   tlmbbefd dmbbefd1 dmbbefd2 MBBEFD dMBBEFD pMBBEFD qMBBEFD rMBBEFD
###   ecMBBEFD mMBBEFD tlMBBEFD dMBBEFD1 dMBBEFD2

### ** Examples

#1st parametrization
#
aPar=0.2
bPar=0.04
rmbbefd(n=10,a=aPar,b=bPar) #for random generation
qmbbefd(p=0.7,a=aPar,b=bPar) #for quantiles
dmbbefd(x=0.5,a=aPar,b=bPar) #for density
pmbbefd(q=0.5,a=aPar,b=bPar) #for distribution function

#2nd parametrization
#
gPar=2
bPar=0.04
rMBBEFD(n=10,g=gPar,b=bPar) #for random generation
qMBBEFD(p=0.7,g=gPar,b=bPar) #for quantiles
dMBBEFD(x=0.5,g=gPar,b=bPar) #for density
pMBBEFD(q=0.5,g=gPar,b=bPar) #for distribution function





