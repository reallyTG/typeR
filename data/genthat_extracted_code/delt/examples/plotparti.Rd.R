library(delt)


### Name: plotparti
### Title: Draws a partition
### Aliases: plotparti
### Keywords: hplot

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=5,type="mulmodII")
et<-densplit(dendat)

pa<-partition(et)

plotparti(pa)




