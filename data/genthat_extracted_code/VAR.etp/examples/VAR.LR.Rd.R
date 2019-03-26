library(VAR.etp)


### Name: VAR.LR
### Title: The Likelihood Ratio test for parameter restrictions
### Aliases: VAR.LR
### Keywords: ts

### ** Examples

data(dat)
#replicating Table 4.4 of Lutkepohl (2005)
restrict1="full";
restrict0 = rbind(c(4,1,1), c(4,1,2), c(4,1,3), c(4,2,1),
c(4,2,2),c(4,2,3),c(4,3,1),c(4,3,2),c(4,3,3))
VAR.LR(dat,p=4,restrict0,restrict1,type="const")



