library(threejs)


### Name: points3d
### Title: Add points to a 3D scatterplot
### Aliases: points3d

### ** Examples

## Not run: 
##D  # Adding point labels to a scatterplot:
##D  x <- rnorm(5)
##D  y <- rnorm(5)
##D  z <- rnorm(5)
##D  scatterplot3js(x, y, z, pch="o") %>%
##D    points3d(x + 0.1, y + 0.1, z, color="red", pch=paste("point", 1:5))
##D 
##D # Adding point labels to a graph, obtaining the graph vertex coordinates
##D # with the `vertices()` function:
##D data(LeMis)
##D graphjs(LeMis) %>% points3d(vertices(.), color="red", pch=V(LeMis)$label)
##D 
## End(Not run)



