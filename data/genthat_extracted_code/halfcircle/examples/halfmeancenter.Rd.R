library(halfcircle)


### Name: halfmeancenter
### Title: Calculate average values of flows and plot them
### Aliases: halfmeancenter

### ** Examples

data(ex_flow)
flow <- subset(ex_flow, ex_flow$veget>5000)
data(ex_node)
node <- ex_node[c(order(-ex_node$gdpc)),]
halfmeancenter(flow, node, dir="vertical")



