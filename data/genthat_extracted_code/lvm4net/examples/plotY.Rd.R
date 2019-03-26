library(lvm4net)


### Name: plotY
### Title: Plot the adjacency matrix of the network
### Aliases: plotY

### ** Examples

N <- 20
Y <- network(N, directed = FALSE)[,]
plotY(Y)
# Store the positions of nodes used to plot Y, in order to redraw the plot using 
# the same positions
z <- plotY(Y, verbose = TRUE)
plotY(Y, EZ = z)



