library(compositions)


### Name: groupparts
### Title: Group amounts of parts
### Aliases: groupparts groupparts.acomp groupparts.rcomp groupparts.aplus
###   groupparts.rplus groupparts.ccomp
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
plot(groupparts(acomp(sa.lognormals5),A=c(1,2),B=c(3,4),C=5))
plot(groupparts(aplus(sa.lognormals5),B=c(3,4),C=5))
plot(groupparts(rcomp(sa.lognormals5),A=c("Cu","Pb"),B=c(2,5)))
hist(groupparts(rplus(sa.lognormals5),1:5))



