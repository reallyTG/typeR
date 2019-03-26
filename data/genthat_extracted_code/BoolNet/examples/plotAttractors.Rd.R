library(BoolNet)


### Name: plotAttractors
### Title: Plot state tables or transition graphs of attractors
### Aliases: plotAttractors
### Keywords: Boolean network attractor cycle basin transition state graph
###   plot

### ** Examples

# load example data
data(cellcycle)

# get attractors
attractors <- getAttractors(cellcycle)

# calculate number of different attractor lengths, 
# and plot attractors side by side in "table" mode
par(mfrow=c(1, length(table(sapply(attractors$attractors,
                          function(attractor)
                          {
                            length(attractor$involvedStates)
                          })))))
plotAttractors(attractors)

# plot attractors in "graph" mode
par(mfrow=c(1, length(attractors$attractors)))
plotAttractors(attractors, mode="graph")

# identify asynchronous attractors
attractors <- getAttractors(cellcycle, type="asynchronous")

# plot attractors in "graph" mode
par(mfrow=c(1, length(attractors$attractors)))
plotAttractors(attractors, mode="graph")



