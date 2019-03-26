library(metadynminer)


### Name: summary.nebpath
### Title: Print summary for Nudged Elastic Band
### Aliases: summary.nebpath

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
summary(nebAD)



