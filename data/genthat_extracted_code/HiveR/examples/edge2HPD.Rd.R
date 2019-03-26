library(HiveR)


### Name: edge2HPD
### Title: Process an Edge List into a Hive Plot Data Object
### Aliases: edge2HPD
### Keywords: utilities

### ** Examples


# Create a simple edge list & process it
edges <- data.frame(lab1 = LETTERS[c(1:8, 7)],
					lab2 = LETTERS[c(2:4, 1:3, 4, 2, 2)],
					weight = c(1, 1, 2, 2, 3, 1, 2, 3, 1))
					
td <- edge2HPD(edge_df = edges, desc = "Test of edge2HPD")
td.out <- sumHPD(td, plot.list = TRUE)
# compare:
edges
td.out[,c(3,7,8)]




