library(metadynminer)


### Name: print.nebpath
### Title: Print Nudged Elastic Band minima
### Aliases: print.nebpath

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
nebAD



