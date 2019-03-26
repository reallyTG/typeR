library(osc)


### Name: cca
### Title: City Clustering Algorithm (CCA)
### Aliases: cca cca.single
### Keywords: utils

### ** Examples


# for a matrix
data(population)
image(population)

clusters <- cca(population, s=5)
cols <- c("white",rep(rainbow(10), length.out=length(table(clusters))) )
image(clusters, col=cols, xlab="", ylab="")

one.cluster <- cca.single(population, s=1, x=125, y=125)
image(one.cluster, col=cols, xlab="", ylab="")

# for a raster-object
data(landcover)

# clustering urban areas
urban <- cca(landcover, cell.class=1,s=2000, unit="m")
str(urban)

# plot the result    
result <- landcover*NA
result[cellFromXY(result,urban$cluster[,c("long","lat")])]<-urban$cluster[,"cluster_id"]*(-1)
plot(result, col=rainbow(9))




