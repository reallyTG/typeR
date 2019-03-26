library(BoolNet)


### Name: generateState
### Title: Generate a state vector from single gene values
### Aliases: generateState
### Keywords: state Boolean network probabilistic Boolean network PBN

### ** Examples

# load cell cycle network
data(cellcycle)

# generate a state in which only CycD and CycA are active
state <- generateState(cellcycle, c("CycD"=1, "CycA"=1))
print(state)

# use the state as a start state for attractor search
print(getAttractors(cellcycle, startStates=list(state)))



