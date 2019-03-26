library(ape)


### Name: rtree
### Title: Generates Random Trees
### Aliases: rtree rcoal rmtree
### Keywords: datagen

### ** Examples

layout(matrix(1:9, 3, 3))
### Nine random trees:
for (i in 1:9) plot(rtree(20))
### Nine random cladograms:
for (i in 1:9) plot(rtree(20, FALSE), type = "c")
### generate 4 random trees of bird orders:
data(bird.orders)
layout(matrix(1:4, 2, 2))
for (i in 1:4)
  plot(rcoal(23, tip.label = bird.orders$tip.label), no.margin = TRUE)
layout(1)
par(mar = c(5, 4, 4, 2))



