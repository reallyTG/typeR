library(s2dverification)


### Name: SelIndices
### Title: Slices A Matrix Along A Dimension
### Aliases: SelIndices
### Keywords: datagen

### ** Examples

a <- array(rnorm(24), dim = c(2, 3, 4, 1))
print(a)
print(a[, , 2:3, ])
print(dim(a[, , 2:3, ]))
print(SelIndices(a, 3, c(2, 3)))
print(dim(SelIndices(a, 3, c(2, 3))))



