library(ape)


### Name: ladderize
### Title: Ladderize a Tree
### Aliases: ladderize
### Keywords: manip

### ** Examples

tr <- rcoal(50)
layout(matrix(1:4, 2, 2))
plot(tr, main = "normal")
plot(ladderize(tr), main = "right-ladderized")
plot(ladderize(tr, FALSE), main = "left-ladderized")
layout(matrix(1, 1))



