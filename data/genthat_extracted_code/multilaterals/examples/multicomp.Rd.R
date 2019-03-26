library(multilaterals)


### Name: multicomp
### Title: multicomp
### Aliases: multicomp

### ** Examples


library(igraph)
library(ape)

data('multil_data')
multicomp(dat.q,dat.p,transitivity='mst',var.agg=c('year','region'),
bench=1,period=2010,idx='fisher',plotting=FALSE)




