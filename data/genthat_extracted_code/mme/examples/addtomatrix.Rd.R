library(mme)


### Name: addtomatrix
### Title: Add rows from a matrix
### Aliases: addtomatrix
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
d=15 # number of areas
t=2  # number of time periods
mat=matrix(1,d*t*(k-1),d*(k-1)) # a matrix

##Add items in the matrix
mat2=addtomatrix(mat,d,t,k)



