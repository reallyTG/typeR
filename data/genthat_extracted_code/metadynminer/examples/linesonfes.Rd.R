library(metadynminer)


### Name: linesonfes
### Title: Plot lines for Nudged Elastic Band projected onto free energy
###   surface
### Aliases: linesonfes

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
plot(minima)
linesonfes(nebAD)



