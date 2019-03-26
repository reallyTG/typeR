library(hyperSpec)


### Name: split
### Title: Split a hyperSpec object according to groups 'split' divides the
###   'hyperSpec' object into a list of 'hyperSpec' objects according to
###   the groups given by 'f'.
### Aliases: split split-methods split,ANY-method split,hyperSpec-method
### Keywords: methods

### ** Examples


dist <- pearson.dist (chondro[[]])
dend <- hclust (dist, method = "ward")
z <- cutree (dend, h = 0.15)

clusters <- split (chondro, z)
length (clusters)

# difference in cluster mean spectra
plot (apply (clusters[[2]], 2, mean) - apply (clusters[[1]], 2, mean))





