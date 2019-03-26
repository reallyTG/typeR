library(OpenImageR)


### Name: MinMaxObject
### Title: minimum and maximum values of vector, matrix, data frame or
###   array
### Aliases: MinMaxObject

### ** Examples


# vector
x = 1:10

res = MinMaxObject(x)


# matrix
x = matrix(runif(100), 10, 10)

res = MinMaxObject(x)


# data frame
x = data.frame(matrix(runif(100), 10, 10))

res = MinMaxObject(x)


# array
x = array(runif(100), dim = c(10, 10, 3))               

res = MinMaxObject(x)




