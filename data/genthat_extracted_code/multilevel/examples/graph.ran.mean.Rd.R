library(multilevel)


### Name: graph.ran.mean
### Title: Graph Random Group versus Actual Group distributions
### Aliases: graph.ran.mean
### Keywords: dplot

### ** Examples

data(bh1996)

# with the bootci=TRUE option, nreps should be 1000 or more.  The value
# of 25 is used in the example to reduce computation time

with(bh1996,graph.ran.mean(HRS,GRP,limits=c(8,16),nreps=25, bootci=TRUE))

GRAPH.DAT<-graph.ran.mean(bh1996$HRS,bh1996$GRP,limits=c(8,16),nreps=25,
           graph=FALSE)



