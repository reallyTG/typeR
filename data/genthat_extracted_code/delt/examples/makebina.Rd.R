library(delt)


### Name: makebina
### Title: Tranforms and evaluation tree to the tree object of R
### Aliases: makebina
### Keywords: hplot

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=5,type="mulmodII")
et<-densplit(dendat)
mb<-makebina(et)

set.seed(1)
dendat<-matrix(rnorm(20),10)  
et<-densplit(dendat,minobs=2)
mb<-makebina(et)

#library(tree)
#plot.tree(mb)

#library(maptree)
#draw.tree(mb)




