library(multilaterals)


### Name: multicompPAR
### Title: multicompPAR
### Aliases: multicompPAR

### ** Examples


library(igraph)
library(ape)
library(parallel)

data('multil_data')
multicompPAR(dat.q,dat.p,transitivity='mst',var.agg=c('year','region'),
 bench=1,period=2010,idx='fisher',Cores=1,plotting=FALSE)



