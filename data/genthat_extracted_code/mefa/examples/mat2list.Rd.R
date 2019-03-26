library(mefa)


### Name: mat2list
### Title: Matrix Manipulation Tools
### Aliases: mat2list mfill rdrop cdrop
### Keywords: manip

### ** Examples

x <- matrix(1:12, 3, 4)
rownames(x) <- letters[1:3]
colnames(x) <- LETTERS[1:4]
mat2list(x, 1)
mat2list(x, 2)
x[2, ] <- 0
x[, 2] <- 0
mfill(x)
mfill(x) == sum(x > 0) / prod(dim(x))
rdrop(x)
cdrop(x)
cdrop(x, cutoff = 5)
cdrop(x, cutoff = 22) # be careful



