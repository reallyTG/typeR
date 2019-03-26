library(imager)


### Name: as.igraph.pixset
### Title: Form an adjacency graph from a pixset
### Aliases: as.igraph.pixset

### ** Examples

library(igraph)
#Simple 3x3 lattice
px <- px.all(imfill(3,3))
as.igraph(px) %>% plot
#Disconnect central pixel
px[5] <- FALSE
as.igraph(px) %>% plot
#Form graph from thresholded image
im <- load.example("coins")
px <- threshold(im) %>% fill(5)
G <- as.igraph(px)
#Label connected components
v <- (igraph::clusters(G)$membership)
as.cimg(v,dim=dim(px)) %>% plot
#Find a path across the image that avoids all
#the coins
G <- as.igraph(!px)
start <- index.coord(im,data.frame(x=1,y=100))
end <- index.coord(im,data.frame(x=384,y=300))
sp <- igraph::shortest_paths(G,start,end,output="vpath")
path <- sp$vpath[[1]] %>% as.integer %>% coord.index(im,.)



