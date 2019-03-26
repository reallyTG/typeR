library(ape)


### Name: as.matching
### Title: Conversion Between Phylo and Matching Objects
### Aliases: as.matching matching as.matching.phylo as.phylo.matching
### Keywords: manip

### ** Examples

data(bird.orders)
m <- as.matching(bird.orders)
str(m)
m
tr <- as.phylo(m)
all.equal(tr, bird.orders, use.edge.length = FALSE)



