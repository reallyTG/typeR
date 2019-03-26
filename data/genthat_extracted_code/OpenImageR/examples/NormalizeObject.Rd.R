library(OpenImageR)


### Name: NormalizeObject
### Title: normalize a vector, matrix or array (in the range between 0 and
###   1)
### Aliases: NormalizeObject

### ** Examples


# vector
x = 1:10

res = NormalizeObject(x)


# matrix
x = matrix(runif(100), 10, 10)

res = NormalizeObject(x)


# data frame
x = data.frame(matrix(runif(100), 10, 10))

res = NormalizeObject(x)


# array
x = array(runif(100), dim = c(10, 10, 3))               

res = NormalizeObject(x)




