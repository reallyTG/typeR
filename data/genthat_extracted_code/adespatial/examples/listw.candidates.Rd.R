library(adespatial)


### Name: listw.candidates
### Title: Function to create a list of spatial weighting matrices
### Aliases: listw.candidates
### Keywords: spatial

### ** Examples

### Create 100 random sampling locations in a squared grid of 120 x 120:
xy <- matrix(nrow = 100, ncol = 2)
xy[, 1] <- sample(c(1:120), 100, replace = FALSE)
xy[, 2] <- sample(c(1:120), 100, replace = FALSE)
### The function listw.candidates is used to build the spatial weighting matrices that
### we want to test and compare (with the listw.select function). We test a Gabriel's graph, 
### a minimum spanning tree, and a distance-based connectivity defined by a threshold
### distance corresponding to the smallest distance keeping all sites connected (i.e., 
### the defaut value of d2). These connectivity matrices are then either not weighted 
### (binary weighting), or weighted by the linearly decreasing function:
candidates <- listw.candidates(coord = xy, nb = c("gab", "mst", "dnear"), 
                               weights = c("binary", "flin"))
names(candidates)                              
plot(candidates[[1]], xy)
plot(candidates[[3]], xy)
### Construction of a different list of spatial weighting matrices. This time, the
### connexions are defined by a distance-based criterion based on the same threshold
### value, but the connections are weighted by the concave-down function with a y parameter
### varying between 2 and 5, and a concave-up function with a y parametre of 0.2.
candidates2 <- listw.candidates(coord = xy, nb = "dnear", weights = c("fdown", "fup"),
                                y_fdown = 1:5, y_fup = 0.2)
### Number of spatial weighting matrices generated:
length(candidates2) 
### A single SWM can also easily be generated with listw.candidates:
lw <- listw.candidates(xy, nb = "gab", weights = "bin")
plot(lw[[1]], xy)

### Generating MEM variables from an object of listw.candidates with scores.listw:
MEM <- scores.listw(lw[[1]])
### See functions mem.select and listw.select for examples of how to use an object
### created by listw.candidates with these functions.





