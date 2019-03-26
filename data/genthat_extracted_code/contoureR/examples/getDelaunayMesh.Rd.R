library(contoureR)


### Name: getDelaunayMesh
### Title: Get Delaunay Mesh
### Aliases: getDelaunayMesh

### ** Examples

#Generate a sample Delaunay Mesh
set.seed(1)
x  = runif(100)
y  = runif(100)
dm = getDelaunayMesh(x,y)

#To demonstrate, Lets view the mesh
library(ggplot2)
library(reshape)
df = as.data.frame(dm); df$id = 1:nrow(df); df = melt(df,id="id")
df = cbind(df,data.frame(x,y)[df$value,])
ggplot(data=df,aes(x,y,group=id)) +
 geom_polygon(aes(fill=id),color="gray")



