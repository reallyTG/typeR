library(gDefrag)


### Name: prioritize
### Title: Prioritizing connectivity corridors
### Aliases: prioritize

### ** Examples

data(road_P)

####### To the value, betweenness and connectivity metrics #######

#Obtaining nodes
out1 <- node.creation(land_polyg = road_P, value_col = "forest_sum", 
scale_nodes = 10, col_nodes = "pink", cex_labels = 1)

#Obtaining edges
out2 <- edge.creation(nodes = out1, land_polyg = road_P, 
min_length = 0, min_pol_area = 0)

#Prioritize
out3 <- prioritize(nodes = out1, edges = out2, 
	method = "value")#Raster value
out4 <- prioritize(nodes = out1, edges = out2, 
	method = "between")#Betweenness
out5 <- prioritize(nodes = out1, edges = out2, 
	method = "IIC")  #Connectivity

####### To the area weighted metric #######

#Obtaining nodes
out6 <- node.creation(land_polyg = road_P, value_col = "proportion", 
scale_nodes = 10, col_nodes = "pink", cex_labels = 1)

#Obtaining edges
out7 <- edge.creation(nodes = out6, land_polyg = road_P, 
min_length = 0, min_pol_area = 0)

#Prioritize
out8 <- prioritize(nodes = out6, edges = out7, 
	method = "AWM")#Habitat proportion




