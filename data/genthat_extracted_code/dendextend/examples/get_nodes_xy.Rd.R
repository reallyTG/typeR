library(dendextend)


### Name: get_nodes_xy
### Title: Get the x-y coordinates of a dendrogram's nodes
### Aliases: get_nodes_xy

### ** Examples

## Not run: 
##D 
##D # If we would like to see the numbers from plot:
##D # ?getOption("verbose")
##D # options(verbose=TRUE)
##D # options(verbose=FALSE)
##D 
##D # -----
##D # Draw a depth first search illustration
##D # -----
##D 
##D dend <- 1:5 %>% dist %>% hclust %>% as.dendrogram
##D get_nodes_xy(dend)
##D 
##D # polygon(get_nodes_xy(dend), col = 2)
##D plot(dend, 
##D      leaflab = "none",
##D      main = "Depth-first search in a dendrogram")
##D xy <- get_nodes_xy(dend)
##D for(i in 1:(nrow(xy)-1)) {
##D    arrows(xy[i,1], xy[i,2], angle = 17,
##D           length = .5,
##D           xy[i+1,1], xy[i+1,2], 
##D           lty = 1, col = 3, lwd = 1.5)   
##D }
##D points(xy, pch = 19, cex = 4)
##D text(xy, labels = 1:nnodes(dend),cex = 1.2, col = "white", adj = c(0.4,0.4))
##D 
## End(Not run)



