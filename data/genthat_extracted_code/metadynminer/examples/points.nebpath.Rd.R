library(metadynminer)


### Name: points.nebpath
### Title: Plot points for Nudged Elastic Band
### Aliases: points.nebpath

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
plot(nebAD)
points(nebAD)



