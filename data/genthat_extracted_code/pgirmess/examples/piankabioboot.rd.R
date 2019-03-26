library(pgirmess)


### Name: piankabioboot
### Title: Bootstrap Pianka's index
### Aliases: piankabioboot
### Keywords: htest

### ** Examples

data(preybiom)
attach(preybiom)
jackal<-preybiom[site=="Y" & sp=="C",5:6]
genet<-preybiom[site=="Y" & sp=="G",5:6]

piankabioboot(jackal,genet,B=100)
  



