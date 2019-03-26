library(LTPDvar)


### Name: LTPDvar-package
### Title: LTPD and AOQL single sampling plans for inspection by variables
### Aliases: LTPDvar-package LTPDvar
### Keywords: package

### ** Examples
# calculation of LTPD plan
zz=planLTPD(N=1000,pt=0.1,pbar=0.001);zz
plot(zz);
# create another plan
zz2=new("ACSPlan", n=16, k=2.71)
plot(zz2,xl=0.001, xu=0.15, xlabm="fraction non-conforming",
ylabm="probability of acceptance",typem="l",typeOC="exact")
plot(new("ACSPlan", n=20, k=2.58555),typeOC="ewmaSK",lam=0.95)
# calculation of AOQL plan
planAOQL(N=1000,pbar=0.005,pL=0.01, method="napprox", cm=1.5)



