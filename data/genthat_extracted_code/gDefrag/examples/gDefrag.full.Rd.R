library(gDefrag)


### Name: gDefrag.full
### Title: Wrapper function running the full process
### Aliases: gDefrag.full

### ** Examples


data(road_P)

out1 <- gDefrag.full(land_polyg = road_P, method = "value", 
value_col = "forest_sum", main = "value-based graph", 
shape = TRUE)




