library(BBRecapture)


### Name: partition.ch
### Title: Partition of partial capture histories according to equivalence
###   classes of numerical quantification corresponding to supplied
###   intervals
### Aliases: partition.ch

### ** Examples


data(mouse)
head(mouse)
t=ncol(mouse)

Mc1.partition=partition.ch(quantify.ch.fun=quant.binary,t=t,breaks=c(0,0.5,1))
Mc1.partition

mod.Mc1.cust=BBRecap.custom.part(mouse,partition=Mc1.partition)
mod.Mc1.cust

mod.Mc1.easy=BBRecap(mouse,mod="Mc",markov.ord=1,output="complete")

mod.Mc1.easy$N.hat.RMSE
mod.Mc1.easy$HPD.N
mod.Mc1.easy$log.marginal.likelihood

# the two functions give the same results!





