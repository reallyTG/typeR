library(magic)


### Name: magic
### Title: Creates magic squares
### Aliases: magic
### Keywords: array

### ** Examples

magic(6)
all(is.magic(magic(3:10)))

## The first eigenvalue of a magic square is equal to the magic constant:
eigen(magic(10),FALSE,TRUE)$values[1] - magic.constant(10)

## The sum of the eigenvalues of a magic square after the first is zero:
sum(eigen(magic(10),FALSE,TRUE)$values[2:10])






