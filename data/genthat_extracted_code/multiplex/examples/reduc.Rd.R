library(multiplex)


### Name: reduc
### Title: Reduce a matrix or array
### Aliases: reduc
### Keywords: manip array cluster

### ** Examples

## scan the multiplication table data
s <- matrix(data=c(1, 1, 1, 3, 3, 3, 3, 3, 3), nrow=3, ncol=3, byrow=TRUE)

## Reduce the multiplication table
reduc(s, clu=c(1,2,2))




