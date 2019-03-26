library(dils)


### Name: RssCell
### Title: Calculate the RSS from one node to another.
### Aliases: RssCell

### ** Examples

M <- as.matrix(get.adjacency(graph.atlas(128)))
M
M <- sweep(M, 1, rowMeans(M), "/")
M
dils:::RssCell(xadj=M, v1=5, v2=6, radius=1)
dils:::RssCell(xadj=M, v1=5, v2=6, radius=2)
dils:::RssCell(xadj=M, v1=5, v2=6, radius=3)
dils:::RssCell(xadj=M, v1=5, v2=6, radius=4)



