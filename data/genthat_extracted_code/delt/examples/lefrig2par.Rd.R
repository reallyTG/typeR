library(delt)


### Name: lefrig2par
### Title: Transforms an evaluation tree so that it can be plotted with the
###   "plottree" function of package "denpro"
### Aliases: lefrig2par
### Keywords: hplot

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=5,type="mulmodII")
et<-densplit(dendat)

lst<-lefrig2par(et)

plottree(lst)




