library(VAR.etp)


### Name: VAR.Rest
### Title: VAR parameter estimation with parameter restrictions
### Aliases: VAR.Rest
### Keywords: ts

### ** Examples

data(dat) 
#replicating Section 5.2.10 of Lutkepohl (2005)
restrict = rbind( c(1,1,2),c(1,1,3),c(1,2,1),c(1,2,2), c(1,3,1),
c(2,1,1), c(2,1,2),c(2,1,3), c(2,2,2), c(2,2,3),c(2,3,1), c(2,3,3),
c(3,1,1), c(3,1,2), c(3,1,3), c(3,2,1), c(3,2,2), c(3,2,3), c(3,3,1),c(3,3,3),
c(4,1,2), c(4,1,3), c(4,2,1), c(4,2,2), c(4,2,3), c(4,3,1),c(4,3,2),c(4,3,3))
M= VAR.Rest(dat,p=4,restrict,type="const",method="gls")
print(M$coef)
print(M$tstat)




