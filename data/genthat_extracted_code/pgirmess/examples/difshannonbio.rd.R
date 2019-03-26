library(pgirmess)


### Name: difshannonbio
### Title: Empirical confidence interval of the bootstrap of the difference
###   between two Shannon indices
### Aliases: difshannonbio
### Keywords: misc

### ** Examples

data(preybiom)
attach(preybiom)
jackal<-preybiom[site=="Y" & sp=="C",5:6]
genet<-preybiom[site=="Y" & sp=="G",5:6]

difshannonbio(jackal,genet,R=150)
  


