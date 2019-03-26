library(tsne)


### Name: tsne
### Title: The t-SNE method for dimensionality reduction
### Aliases: tsne

### ** Examples
## Not run: 
##D colors = rainbow(length(unique(iris$Species)))
##D names(colors) = unique(iris$Species)
##D ecb = function(x,y){ plot(x,t='n'); text(x,labels=iris$Species, col=colors[iris$Species]) }
##D tsne_iris = tsne(iris[,1:4], epoch_callback = ecb, perplexity=50)
##D 
##D # compare to PCA
##D dev.new()
##D pca_iris = princomp(iris[,1:4])$scores[,1:2]
##D plot(pca_iris, t='n')
##D text(pca_iris, labels=iris$Species,col=colors[iris$Species])
## End(Not run)



