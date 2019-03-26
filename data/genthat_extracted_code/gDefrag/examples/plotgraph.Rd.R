library(gDefrag)


### Name: plotgraph
### Title: Plotting the spatial graph
### Aliases: plotgraph

### ** Examples

data(road_P)

#Obtaining nodes
out1 <- node.creation(land_polyg = road_P, value_col = "forest_sum", 
scale_nodes = 10, col_nodes = "pink", cex_labels = 1)

#Obtaining edges
out2 <- edge.creation(nodes = out1, land_polyg = road_P, 
min_length = 0, min_pol_area = 0)

#Prioritize
out3 <- prioritize(nodes = out1, edges = out2, method = "value")

#Plotting results
plotgraph(nodes = out1, edges = out3, land_polyg = road_P, main = "Habitat value")



