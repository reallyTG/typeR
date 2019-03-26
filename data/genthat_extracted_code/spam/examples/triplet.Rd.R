library(spam)


### Name: triplet
### Title: Transform a spam format to triplets
### Aliases: triplet
### Keywords: array

### ** Examples

x <- diag.spam(1:4)
x[2,3] <- 5
triplet(x)
all.equal( spam( triplet(x, tri=TRUE)), x)




