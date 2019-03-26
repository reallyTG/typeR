library(phylin)


### Name: d.gen
### Title: Genetic distance matrix between vipers and lineages.
### Aliases: d.gen
### Keywords: datasets

### ** Examples

data(d.gen)
hc <- hclust(as.dist(d.gen))
plot(hc, hang = -1, main="Vipers genetic distance tree", 
     xlab="Samples", cex=0.7)



