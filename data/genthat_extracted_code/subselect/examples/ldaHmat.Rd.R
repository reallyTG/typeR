library(subselect)


### Name: ldaHmat
### Title: Total and Between-Group Deviation Matrices in Linear
###   Discriminant Analysis
### Aliases: ldaHmat ldaHmat.default ldaHmat.formula ldaHmat.data.frame
### Keywords: manip

### ** Examples

##--------------------------------------------------------------------

## An example with a very small data set. We consider the Iris data
## and three groups, defined by species (setosa, versicolor and
## virginica). 

data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
irisHmat

##$mat
##             Sepal.Length Sepal.Width Petal.Length Petal.Width
##Sepal.Length   102.168333   -6.322667     189.8730    76.92433
##Sepal.Width     -6.322667   28.306933     -49.1188   -18.12427
##Petal.Length   189.873000  -49.118800     464.3254   193.04580
##Petal.Width     76.924333  -18.124267     193.0458    86.56993

##$H
##             Sepal.Length Sepal.Width Petal.Length Petal.Width
##Sepal.Length     63.21213   -19.95267     165.2484    71.27933
##Sepal.Width     -19.95267    11.34493     -57.2396   -22.93267
##Petal.Length    165.24840   -57.23960     437.1028   186.77400
##Petal.Width      71.27933   -22.93267     186.7740    80.41333

##$r
##[1] 2

##$call
##ldaHmat.data.frame(x = iris[1:4], grouping = iris$Species)







