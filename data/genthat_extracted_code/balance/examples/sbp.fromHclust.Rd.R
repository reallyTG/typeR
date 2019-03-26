library(balance)


### Name: sbp.fromHclust
### Title: Build SBP Matrix from hclust Object
### Aliases: sbp.fromHclust

### ** Examples

library(balance)
data(cars)
h <- hclust(dist(cars))
sbp.fromHclust(h)




