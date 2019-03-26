library(TDCor)


### Name: shortest.path
### Title: Calculate the shortest path linking every pairs of nodes in the
###   network
### Aliases: shortest.path
### Keywords: Side functions

### ** Examples



## Example with a 3-genes network where gene A upregulates B which upregulates A; and C represses B.
## the three edges have different bootstrap values (100, 60 and 55)

network=data.frame(matrix(c(0,100,0,0,60,0,0,-55,0),3,3))
names(network)=c("gene A","gene B","gene C")
rownames(network)=c("gene A","gene B","gene C")

shortest.path(as.matrix(network),1)




