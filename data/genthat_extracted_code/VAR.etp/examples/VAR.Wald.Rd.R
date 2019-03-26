library(VAR.etp)


### Name: VAR.Wald
### Title: Wald test for parameter restrictions
### Aliases: VAR.Wald
### Keywords: ts

### ** Examples

data(dat)
#replicating Section 3.6.2 of Lutkepohl (2005)
restrict = rbind( c(1,1,2),c(1,1,3), c(2,1,2),c(2,1,3))
VAR.Wald(dat,p=2,restrict,type="const")



