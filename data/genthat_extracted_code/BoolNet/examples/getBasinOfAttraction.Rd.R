library(BoolNet)


### Name: getBasinOfAttraction
### Title: Get states in basin of attraction
### Aliases: getBasinOfAttraction
### Keywords: Boolean network attractor cycle basin

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# print basin of first attractor
print(getBasinOfAttraction(attractors, 1))



