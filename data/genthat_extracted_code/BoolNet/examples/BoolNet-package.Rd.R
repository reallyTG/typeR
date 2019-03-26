library(BoolNet)


### Name: BoolNet-package
### Title: Construction, Simulation and Analysis of Boolean Networks
### Aliases: BoolNet-package BoolNet
### Keywords: package Boolean network probabilistic Boolean network PBN
###   attractor cycle basin transition Markov chain simulation state graph
###   reconstruction

### ** Examples

##################################
# Example 1: identify attractors #
################################## 

# load example data
data(cellcycle)

# get all synchronous attractors by exhaustive search
attractors <- getAttractors(cellcycle)

# plot attractors side by side
par(mfrow=c(2,length(attractors$attractors)))
plotAttractors(attractors)

# identifies asynchronous attractors
attractors <- getAttractors(cellcycle, 
                            type="asynchronous", startStates=100)
                            
plotAttractors(attractors, mode="graph")

####################################
# Example 2: reconstruct a network #
####################################

# load example data
data(yeastTimeSeries)

# perform binarization with k-means
bin <- binarizeTimeSeries(yeastTimeSeries)

# reconstruct networks from transition table
net <- reconstructNetwork(bin$binarizedMeasurements, 
                          method="bestfit", maxK=3, returnPBN=TRUE)

# analyze the network using a Markov chain simulation
print(markovSimulation(net, returnTable=FALSE))



