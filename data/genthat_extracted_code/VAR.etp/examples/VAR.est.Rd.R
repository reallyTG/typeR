library(VAR.etp)


### Name: VAR.est
### Title: Estimation of unrestricted VAR(p) model parameters
### Aliases: VAR.est
### Keywords: ts

### ** Examples


#replicating Section 3.2.3 of of Lutkepohl (2005)
data(dat)
M=VAR.est(dat,p=2,type="const")
print(M$coef)
print(M$tratio)



