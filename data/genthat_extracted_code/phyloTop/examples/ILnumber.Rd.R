library(phyloTop)


### Name: ILnumber
### Title: IL number
### Aliases: ILnumber

### ** Examples

## Find the IL number of a random tree with 10 tips:
tree <- rtree(10)
plot(tree)
ILnumber(tree)
## and the normalised IL number:
ILnumber(tree, normalise=TRUE)




