library(NeatMap)


### Name: stereo.profileplot3d
### Title: Make a Stereo rotatable plot showing data profiles
### Aliases: stereo.profileplot3d make.stereo.profileplot3d
### Keywords: hplot

### ** Examples

make.stereo.profileplot3d(mtcars,row.method="PCA",column.method="average.linkage")

#is equivalent to
mtcars.PCA<-prcomp(mtcars)
mtcars.col.cluster<-hclust(dist(t(mtcars)),method="average")
mtcars.row.cluster<-hclust(as.dist(1-cor(t(mtcars))),method="average")
stereo.profileplot3d(mtcars.PCA$x,mtcars,column.order=mtcars.col.cluster$order,
row.cluster=mtcars.row.cluster,column.cluster=mtcars.col.cluster)

#use of alternate colors and color scaling
make.stereo.profileplot3d(mtcars,row.method="PCA",column.method="average.linkage",
col=c("yellow","black","blue"),
color_scaling_function=function(x){0.5+tanh(10*(x-0.5))/2})





