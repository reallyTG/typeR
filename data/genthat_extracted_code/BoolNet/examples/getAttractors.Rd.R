library(BoolNet)


### Name: getAttractors
### Title: Identify attractors in a Boolean network
### Aliases: getAttractors
### Keywords: Boolean network synchronous update asynchronous update
###   symbolic Boolean network attractor cycle basin

### ** Examples

# load example data
data(cellcycle)

# get all synchronous attractors by exhaustive search
attractors <- getAttractors(cellcycle)

# plot attractors side by side
par(mfrow=c(2, length(attractors$attractors)))
plotAttractors(attractors)

# finds the synchronous attractor with 7 states
attractors <- getAttractors(cellcycle, method="chosen",
                            startStates=list(rep(1, length(cellcycle$genes))))
plotAttractors(attractors)

# finds the attractor with 1 state
attractors <- getAttractors(cellcycle, method="chosen",
                            startStates=list(rep(0, length(cellcycle$genes))))
plotAttractors(attractors)

# also finds the attractor with 1 state by restricting the attractor length
attractors <- getAttractors(cellcycle, method="sat.restricted",
                            maxAttractorLength=1)
plotAttractors(attractors)

# identifies asynchronous attractors
attractors <- getAttractors(cellcycle, type="asynchronous", startStates=100)
plotAttractors(attractors, mode="graph")



