library(cba)


### Name: order
### Title: Improving the Presentation of Matrix Objects
### Aliases: order.dist order.matrix order.data.frame
### Keywords: cluster

### ** Examples

## not a hard problem
data(iris)
d <- dist(iris[1:4])
implot(order.dist(d))
data(townships)
x <- order.data.frame(townships)
x



