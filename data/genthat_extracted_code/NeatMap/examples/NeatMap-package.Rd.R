library(NeatMap)


### Name: NeatMap-package
### Title: Non-clustered Heatmaps
### Aliases: NeatMap-package NeatMap
### Keywords: package

### ** Examples


#heatmap1 using pca (the scale_x_continuous ensures that labels can be seen)
make.heatmap1(mtcars,row.method="PCA",column.method="average.linkage",
row.labels=rownames(mtcars),column.labels=colnames(mtcars))+
scale_x_continuous(lim=c(-1,15))
#circularmap using nMDS and pearson correlation
make.circularmap(as.matrix(mtcars),metric="euclidean",cluster.method="complete.linkage",
normalize.profiles=FALSE,label.names=rownames(mtcars),label.size=3)

#lineplot using pca
mtcars.PCA<-prcomp(mtcars);
lineplot(mtcars.PCA$x,mtcars);

#profileplot3d  and stereo.profileplot3d using PCA
make.profileplot3d(mtcars,row.method="PCA",column.method="average.linkage")
make.stereo.profileplot3d(mtcars,row.method="PCA",column.method="average.linkage")

#dendrogram3d to compare nMDS result to clustering
mtcars.nMDS<-nMDS(mtcars,metric="euclidean")
mtcars.cluster<-hclust(dist(as.matrix(mtcars)),method="complete")
draw.dendrogram3d(mtcars.cluster,mtcars.nMDS$x,labels=rownames(mtcars),
label.size=0.5)



