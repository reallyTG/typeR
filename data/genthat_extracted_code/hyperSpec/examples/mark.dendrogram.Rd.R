library(hyperSpec)


### Name: mark.dendrogram
### Title: Mark groups in 'hclust' dendrograms
### Aliases: mark.dendrogram

### ** Examples


dend <- hclust (pearson.dist (laser[[]]))
par (xpd = TRUE, mar = c (5.1, 4, 4, 3)) # allows plotting into the margin
plot (dend, hang = -1, labels = FALSE)

## mark clusters
clusters <- as.factor (cutree (dend, k = 4))
levels (clusters) <- LETTERS [1 : 4]
mark.dendrogram (dend, clusters, label = "cluster")

## mark independent factor
mark.dendrogram (dend, as.factor (laser [,,405.36] > 11000),
pos.marker = -0.02, pos.text = - 0.03)

## mark continuous variable: convert it to a factor and omit labels
mark.dendrogram (dend, cut (laser [[,, 405.36]], 100), alois.palette (100),
                 pos.marker = -.015, text.col = NA,
                 label = expression (I [lambda == 405.36~nm]), label.right = FALSE)
 



