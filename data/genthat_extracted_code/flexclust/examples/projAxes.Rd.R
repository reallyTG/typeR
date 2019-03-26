library(flexclust)


### Name: projAxes
### Title: Add Arrows for Projected Axes to a Plot
### Aliases: projAxes projAxes projAxes-class plot,projAxes,missing-method
###   placeLabels placeLabels,projAxes-method
### Keywords: hplot

### ** Examples

data(milk)
milk.pca <- prcomp(milk, scale=TRUE)

## create a biplot step by step
plot(predict(milk.pca), type="n")
text(predict(milk.pca), rownames(milk), col="green", cex=0.8)
projAxes(milk.pca)

## the same, but arrows are blue, centered at origin and all arrows are
## plotted 
plot(predict(milk.pca), type="n")
text(predict(milk.pca), rownames(milk), col="green", cex=0.8)
projAxes(milk.pca, col="blue", center=0, minradius=0)

## use points instead of text, plot PC2 and PC3, manual radius
## specification, store result
plot(predict(milk.pca)[,c(2,3)])
arr <- projAxes(milk.pca, which=c(2,3), radius=1.2, plot=FALSE)
plot(arr)

## Not run: 
##D 
##D ## manually try to find new places for the labels: each arrow is marked
##D ## active in turn, use the left mouse button to find a better location
##D ## for the label. Use the right mouse button to go on to the next
##D ## variable.
##D 
##D arr1 <- placeLabels(arr)
##D 
##D ## now do the plot again:
##D plot(predict(milk.pca)[,c(2,3)])
##D plot(arr1)
## End(Not run)




