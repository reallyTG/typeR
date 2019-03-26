library(ForImp)


### Name: transfmatcat
### Title: Transforming a matrix of continuous values into a matrix of
###   ordinal values
### Aliases: transfmatcat
### Keywords: datagen multivariate

### ** Examples

# generate a 40*3 matrix from a multivariate normal r.v.
# whose independent components have mean 10 and standard deviation 4
mat<-matrix(rnorm(40,3),10,4)
# transform the matrix of normal data into a matrix of ordinal data
transfmatcat(mat, cat=c(2,3,4,3))



