library(metadynminer)


### Name: pointsonfes
### Title: Plot points for Nudged Elastic Band projected onto free energy
###   surface
### Aliases: pointsonfes

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
plot(minima)
pointsonfes(nebAD)



