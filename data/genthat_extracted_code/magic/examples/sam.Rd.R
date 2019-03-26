library(magic)


### Name: sam
### Title: Sparse antimagic squares
### Aliases: sam
### Keywords: array

### ** Examples

sam(6,2)

jj <- matrix(c(
     5, 2, 3, 4, 1,
     3, 5, 4, 1, 2,
     2, 3, 1, 5, 4,
     4, 1, 2, 3, 5, 
     1, 4, 5, 2, 3),5,5)

is.sam(sam(5,2,B=jj))




