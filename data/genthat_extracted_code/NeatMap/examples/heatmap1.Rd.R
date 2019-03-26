library(NeatMap)


### Name: heatmap1
### Title: Make a non-clustered heatmap
### Aliases: heatmap1 make.heatmap1
### Keywords: hplot

### ** Examples

make.heatmap1(mtcars,row.method="PCA",column.method="average.linkage")

#is equivalent to
mtcars.PCA<-prcomp(mtcars)
mtcars.PCA.order<-order(apply(mtcars.PCA$x[,1:2],1,function(x){atan2(x[1],x[2])}))
mtcars.column.cluster<-hclust(as.dist(1-cor(mtcars)),method="average")
mtcars.row.cluster<-hclust(as.dist(1-cor(t(mtcars))),method="average")
heatmap1(mtcars,row.order=mtcars.PCA.order,column.order=mtcars.column.cluster$order,
row.cluster=mtcars.row.cluster,column.cluster=mtcars.column.cluster)

#Changing Color Scheme
make.heatmap1(mtcars,row.method="PCA",column.method="average.linkage")+
scale_fill_gradient2(low="yellow",high="blue",mid="black",midpoint=200)

#Adding labels (the scale function ensures that labels are not clipped)
make.heatmap1(mtcars,row.method="PCA",column.method="average.linkage",
row.labels=rownames(mtcars),column.labels=colnames(mtcars))+
scale_x_continuous(lim=c(-1,15))



