library(data.table)


### Name: as.matrix
### Title: Convert a data.table to a matrix
### Aliases: as.matrix as.matrix.data.table
### Keywords: array

### ** Examples

DT <- data.table(A = letters[1:10], X = 1:10, Y = 11:20)
as.matrix(DT) # character matrix
as.matrix(DT, rownames = "A")
as.matrix(DT, rownames = 1)
as.matrix(DT, rownames = TRUE)

setkey(DT, A)
as.matrix(DT, rownames = TRUE)



