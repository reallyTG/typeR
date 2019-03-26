library(fclust)


### Name: plot.fclust
### Title: Plotting fuzzy clustering output
### Aliases: plot.fclust
### Keywords: multivariate

### ** Examples

## McDonald's data
data(Mc)
names(Mc)
## data normalization by dividing the nutrition facts by the Serving Size (column 1)
for (j in 2:(ncol(Mc)-1))
Mc[,j]=Mc[,j]/Mc[,1]
## removing the column Serving Size
Mc=Mc[,-1]
## fuzzy k-means
## (excluded the factor column Type (last column))
clust=FKM(Mc[,1:(ncol(Mc)-1)],k=6,m=1.5,stand=1)
## Scatter plot of Calories vs Cholesterol (mg)
names(Mc)
plot(clust,v1v2=c(1,5))
## Scatter plot of Calories vs Cholesterol (mg) using gray levels for the clusters
plot(clust,v1v2=c(1,5),colclus=gray.colors(6))
## Scatter plot of Calories vs Cholesterol (mg)
## coloring in black objects with maximal membership degree lower than 0.5
plot(clust,v1v2=c(1,5),umin=0.5)
## Scatter plot of Calories vs Cholesterol (mg)
## coloring in black objects with maximal membership degree lower than 0.5
## and magnifying the points according to the maximal membership degree
plot(clust,v1v2=c(1,5),umin=0.5,ucex=TRUE)
## Scatter plot using the first two principal components and
## coloring in black objects with maximal membership degree lower than 0.3
plot(clust,v1v2=1:2,umin=0.3,pca=TRUE)



