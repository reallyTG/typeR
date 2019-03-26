library(metadynminer)


### Name: neb
### Title: Find transition path on free energy surface by Nudged Elastic
###   Band method
### Aliases: neb

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
nebAD



