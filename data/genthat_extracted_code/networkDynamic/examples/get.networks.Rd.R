library(networkDynamic)


### Name: get.networks
### Title: Obtain a list of collapsed networks sampled periodically from a
###   networkDynamic object
### Aliases: get.networks

### ** Examples

# create a networkDynamic with some basic activity and time extended attributes (TEA)
test <- network.initialize(5)
add.edges.active(test, tail=c(1,2,3), head=c(2,3,4),onset=0,terminus=1)
activate.edges(test,onset=3,terminus=5)
activate.edges(test,onset=-2,terminus=-1)
activate.edge.attribute(test,'weight',5,onset=3,terminus=4)
activate.edge.attribute(test,'weight',3,onset=4,terminus=5,e=1:2)

# obtain the list of networks
list <- get.networks(test,start=0, end=5)

# aggregate over a longer time period with specified rule
list <- get.networks(test,start=0, end=6,time.increment=2,rule='latest')

# use 'at' style extraction of momentary slices via onsets & termini
list <- get.networks(test,onsets=0:5,termini=0:5)

# ensure that all networks returned will be the same size
list <- get.networks(test,onsets=0:5,termini=0:5,retain.all.vertices=TRUE)


# find out how many edges in each sampling point with apply
sapply(get.networks(test,start=0,end=5),network.edgecount)

# generate a list of matrices
lapply(get.networks(test,start=0,end=5),as.matrix)





