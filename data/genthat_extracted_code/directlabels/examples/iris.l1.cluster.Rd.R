library(directlabels)


### Name: iris.l1.cluster
### Title: Clustering of the iris data with the l1 clusterpath
### Aliases: iris.l1.cluster
### Keywords: datasets

### ** Examples

data(iris.l1.cluster,package="directlabels")
iris.l1.cluster$y <- iris.l1.cluster$alpha
if(require(ggplot2)){
  p <- ggplot(iris.l1.cluster,aes(lambda,y,group=row,colour=Species))+
    geom_line(alpha=1/4)+
    facet_grid(col~.)
  p2 <- p+xlim(-0.0025,max(iris.l1.cluster$lambda))
  print(direct.label(p2,list(first.points,get.means)))
}



