library(agricolae)


### Name: similarity
### Title: Matrix of similarity in binary data
### Aliases: similarity
### Keywords: models

### ** Examples

#example table of molecular markers
library(agricolae)
data(markers)
distance<-similarity(markers)
#startgraph
tree<-hclust(distance,method="mcquitty")
plot(tree,col="blue")
#endgraph



