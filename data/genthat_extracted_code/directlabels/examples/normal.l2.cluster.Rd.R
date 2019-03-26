library(directlabels)


### Name: normal.l2.cluster
### Title: Clustering of some normal data in 2d with the l2 clusterpath
### Aliases: normal.l2.cluster
### Keywords: datasets

### ** Examples

data(normal.l2.cluster)
if(require(ggplot2)){
  p <- ggplot(normal.l2.cluster$path,aes(x,y))+
    geom_path(aes(group=row),colour="grey")+
    geom_point(aes(size=lambda),colour="grey")+
    geom_point(aes(colour=class),data=normal.l2.cluster$pts)+
    coord_equal()
  print(direct.label(p))
}



