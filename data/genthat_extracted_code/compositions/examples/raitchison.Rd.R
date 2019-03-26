library(compositions)


### Name: rAitchison
### Title: Aitchison Distribution
### Aliases: rAitchison dAitchison AitchisonDistributionIntegrals
### Keywords: distribution

### ** Examples

(erg<-AitchisonDistributionIntegrals(c(-1,3,-2),ilrvar2clr(-diag(c(1,2))),grid=20))

(myvar<-with(erg, -1/2*ilrvar2clr(solve(clrvar2ilr(beta)))))
(mymean<-with(erg,myvar%*%theta))

with(erg,myvar-clrVar)
with(erg,mymean-clrMean)




