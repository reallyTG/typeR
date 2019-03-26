library(metadynminer)


### Name: lines.nebpath
### Title: Plot lines for Nudged Elastic Band
### Aliases: lines.nebpath

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
nebAD<-neb(minima, min1="A", min2="D", nsteps=20)
plot(nebAD)
lines(nebAD, lwd=4)



