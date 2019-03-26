library(statnet.common)


### Name: order
### Title: Implement the 'sort' and 'order' methods for 'data.frame' and
###   'matrix', sorting it in lexicographic order.
### Aliases: order order.default order.data.frame order.matrix
###   sort.data.frame
### Keywords: manip

### ** Examples


data(iris)

head(iris)

head(order(iris))

head(sort(iris))

stopifnot(identical(sort(iris),iris[order(iris),]))



