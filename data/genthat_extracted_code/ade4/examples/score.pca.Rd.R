library(ade4)


### Name: score.pca
### Title: Graphs to Analyse a factor in PCA
### Aliases: score.pca
### Keywords: multivariate hplot

### ** Examples

data(deug)
dd1 <- dudi.pca(deug$tab, scan = FALSE)
score(dd1)
 
# The correlations are :
dd1$co[,1]
# [1] 0.7925 0.6532 0.7410 0.5287 0.5539 0.7416 0.3336 0.2755 0.4172



