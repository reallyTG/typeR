library(pgirmess)


### Name: piankabio
### Title: Computes the Pianka's index of niche overlap
### Aliases: piankabio
### Keywords: misc

### ** Examples


data(preybiom)
attach(preybiom)
jackal<-preybiom[site=="Y" & sp=="C",5:6]
genet<-preybiom[site=="Y" & sp=="G",5:6]

piankabio(jackal,genet)
  



