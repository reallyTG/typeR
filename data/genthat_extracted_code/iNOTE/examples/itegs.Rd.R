library(iNOTE)


### Name: itegs
### Title: Integrative Total Effect of a Gene Set Test
### Aliases: itegs
### Keywords: multivariate

### ** Examples

data(X); data(Y); data(CPG); data(GE)
itegs(iCPG=CPG, iGE=GE, iY=Y, iX=X, imodel='mgc', iapprox='pert', gsp.emp=FALSE);
itegs(iCPG=CPG, iGE=GE, iY=Y, iX=X, imodel='mgc', iapprox='davies');




