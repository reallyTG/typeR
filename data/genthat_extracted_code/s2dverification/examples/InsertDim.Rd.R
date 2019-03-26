library(s2dverification)


### Name: InsertDim
### Title: Adds A Dimension To An Array
### Aliases: InsertDim
### Keywords: datagen

### ** Examples

a <- array(rnorm(15), dim = c(3, 1, 5, 1))
print(dim(a))
print(dim(a[, , , ]))
print(dim(InsertDim(InsertDim(a[, , , ], 2, 1), 4, 1)))



