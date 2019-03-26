library(multiplex)


### Name: as.semigroup
### Title: Coerce to a Semigroup Object
### Aliases: as.semigroup
### Keywords: algebra math

### ** Examples

## create labeled multiplication table data
s <- matrix(data=c(1, 1, 1, 3, 3, 3, 3, 3, 3), nrow=3, ncol=3, byrow=TRUE)
attr(s, "dimnames") <- list(1:3,1:3)

## make a semigroup object
as.semigroup(s)




