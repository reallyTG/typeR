library(metadynminer)


### Name: plot.profiles
### Title: Plot free energy profile
### Aliases: plot.profiles

### ** Examples

tfes<-fes(acealanme, imax=5000)
minima<-fesminima(tfes)
prof<-feprof(minima)
plot(prof)



