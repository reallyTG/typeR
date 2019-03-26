library(tiger)


### Name: change.order.clusters
### Title: Change numbering of clusters
### Aliases: change.order.clusters
### Keywords: utilities

### ** Examples

data(tiger.example)

new.order <- c(6,3,2,5,4,1)

cmeans.result <- tiger.single$cluster.assignment[[6]]
str(cmeans.result)
cmeans.result2 <- change.order.clusters(cmeans.result, new.order)



