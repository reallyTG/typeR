library(bigmemory)


### Name: big.matrix
### Title: The core "big.matrix" operations.
### Aliases: big.matrix filebacked.big.matrix as.big.matrix is.big.matrix
###   is.big.matrix,big.matrix-method is.big.matrix,ANY-method is.separated
###   is.separated,big.matrix-method is.filebacked
###   is.filebacked,big.matrix-method shared.name
###   shared.name,big.matrix-method file.name file.name,big.matrix-method
###   dir.name dir.name,big.matrix-method is.shared
###   is.shared,big.matrix-method is.readonly is.readonly,big.matrix-method
###   is.nil
### Keywords: classes methods

### ** Examples

library(bigmemory)
x <- big.matrix(10, 2, type='integer', init=-5)
options(bigmemory.allow.dimnames=TRUE)
colnames(x) <- c("alpha", "beta")
is.big.matrix(x)
dim(x)
colnames(x)
rownames(x)
x[,]
x[1:8,1] <- 11:18
colnames(x) <- NULL
x[,]

# The following shared memory example is quite silly, as you wouldn't
# likely do this in a single R session.  But if zdescription were
# passed to another R session via SNOW, foreach, or even by a
# simple file read/write, then the attach.big.matrix() within the
# second R process would give access to the same object in memory.
# Please see the package vignette for real examples.

z <- big.matrix(3, 3, type='integer', init=3)
z[,]
dim(z)
z[1,1] <- 2
z[,]
zdescription <- describe(z)
zdescription
y <- attach.big.matrix(zdescription)
y[,]
y
z
y[1,1] <- -100
y[,]
z[,]



