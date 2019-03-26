library(BoolNet)


### Name: stateTransition
### Title: Perform a transition to the next state
### Aliases: stateTransition
### Keywords: state transition Boolean network synchronous update
###   asynchronous update probabilistic Boolean network PBN transition
###   state

### ** Examples

# load example network
data(cellcycle)

# calculate a synchronous state transition
print(stateTransition(cellcycle, c(1,1,1,1,1,1,1,1,1,1)))

# calculate an asynchronous state transition of gene CycA
print(stateTransition(cellcycle, c(1,1,1,1,1,1,1,1,1,1),
                      type="asynchronous", chosenGene="CycA"))
                      
# load probabilistic network
data(examplePBN)

# perform a probabilistic state transition
print(stateTransition(examplePBN, c(0,1,1),
                      type="probabilistic"))       



