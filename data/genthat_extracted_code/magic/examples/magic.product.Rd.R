library(magic)


### Name: magic.product
### Title: Product of two magic squares
### Aliases: magic.product magic.product magic.product.fast
### Keywords: array

### ** Examples

magic.product(magic(3),magic(4))
magic.product(3,4)

mat <- matrix(0,3,3)
a <- magic.product(3,4,mat=mat)
mat[1,1] <- 1
b <- magic.product(3,4,mat=mat)

a==b



