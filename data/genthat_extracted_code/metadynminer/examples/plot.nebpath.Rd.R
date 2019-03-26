library(metadynminer)


### Name: plot.nebpath
### Title: Plot Nudged Elastic Band
### Aliases: plot.nebpath

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
plot(nebAD)



