library(imager)


### Name: as.igraph.cimg
### Title: Form a graph from an image
### Aliases: as.igraph.cimg

### ** Examples

library(igraph)
im <- imfill(5,5)
G <- as.igraph(im)
plot(G)
#Shortest-path distance from pixel 1 to all other pixels
d <- igraph::distances(G,1) %>% as.vector
as.cimg(d,dim=gsdim(im)) %>% plot(interpolate=FALSE)
#Notice that moving along the diagonal has the same cost
#as moving along the cardinal directions, whereas the Euclidean distance
#is actually sqrt(2) and not 1. 
#Modify weight attribute, to change the way distance is computed
igraph::E(G)$weight <- G$dist
d2 <- igraph::distances(G,1) %>% as.vector
as.cimg(d2,dim=gsdim(im)) %>% plot(interpolate=FALSE)
#More interesting example
im <- grayscale(boats)
G <- as.igraph(im)
#value.from holds the value of the source pixel, value.to the sink's
#set w_ij = (|v_i - v_j|)/d_ij
igraph::E(G)$weight <- (abs(G$value.from - G$value.to))/G$dist
igraph::distances(G,5000) %>% as.vector %>%
    as.cimg(dim=gsdim(im)) %>% plot



