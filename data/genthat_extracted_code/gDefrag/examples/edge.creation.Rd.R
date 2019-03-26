library(gDefrag)


### Name: edge.creation
### Title: Creating graph edges
### Aliases: edge.creation

### ** Examples

data(road_P)

out1 <- node.creation(land_polyg=road_P, value_col = "forest_sum", scale_nodes = 10, 
col_nodes = "pink", cex_labels = 0.7)

out2 <- edge.creation(nodes = out1, land_polyg = road_P, min_length = 0, 
min_pol_area = 0, plot = FALSE)




