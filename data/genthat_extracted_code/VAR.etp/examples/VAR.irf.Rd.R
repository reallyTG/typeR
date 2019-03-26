library(VAR.etp)


### Name: VAR.irf
### Title: Orthogonalized impluse response functions from an estimated
###   VAR(p) model
### Aliases: VAR.irf
### Keywords: ts

### ** Examples


#replicating Table 3.4 and Figure 3.11 Lutkepohl (2005)
data(dat)
M=VAR.est(dat,p=2,type="const")
b=M$coef; sigu=M$sigu
VAR.irf(b,p=2,sigu,graphs=TRUE)



