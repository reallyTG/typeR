library(ape)


### Name: add.scale.bar
### Title: Add a Scale Bar to a Phylogeny Plot
### Aliases: add.scale.bar
### Keywords: aplot

### ** Examples

tr <- rtree(10)
layout(matrix(1:2, 2, 1))
plot(tr)
add.scale.bar()
plot(tr)
add.scale.bar(cex = 0.7, font = 2, col = "red")
layout(1)



