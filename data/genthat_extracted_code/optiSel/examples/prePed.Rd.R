library(optiSel)


### Name: prePed
### Title: *Pre*pares a *Ped*igree
### Aliases: prePed

### ** Examples

data(PedigWithErrors)
Pedig <- prePed(PedigWithErrors)

tail(Pedig)
hist(Pedig$I, freq=FALSE, ylim=c(0,0.2))



