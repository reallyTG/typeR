library(Thresher)


### Name: Thresher-class
### Title: Class '"Thresher"'
### Aliases: Thresher-class Thresher heat,Thresher-method
###   makeFigures,Thresher-method plot,Thresher,missing-method
###   scatter,Thresher-method screeplot,Thresher-method
###   getColors,Thresher-method getSplit,Thresher-method
###   getStyles,Thresher-method
### Keywords: classes cluster

### ** Examples

set.seed(3928270)
ranData <- matrix(rnorm(100*12), ncol=12)
colnames(ranData) <- paste("G", 1:12, sep='')
thresh <- Thresher(ranData) # fit the model
screeplot(thresh)           # check the scree plot; suggests dim = 4
plot(thresh@ag, list(thresh@agfun)) # Auer-Gervini object; dim = 0
scatter(thresh)             # PCA scatter plot  (rows = samples)
plot(thresh)                # PCA loadings plot (cols = features)
heat(thresh)                # ubiquitous 2-way heatmap



