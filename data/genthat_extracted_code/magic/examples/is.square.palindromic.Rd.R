library(magic)


### Name: is.square.palindromic
### Title: Is a square matrix square palindromic?
### Aliases: is.square.palindromic is.centrosymmetric is.persymmetric
### Keywords: array

### ** Examples

is.square.palindromic(magic(3))
is.persymmetric(matrix(c(1,0,0,1),2,2))

#now try a circulant:
a <- matrix(0,5,5)
is.square.palindromic(circulant(10))  #should be TRUE



