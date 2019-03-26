library(ClusterR)


### Name: soybean
### Title: The soybean (large) data set from the UCI repository
### Aliases: soybean
### Keywords: datasets

### ** Examples


data(soybean)

X = soybean[, -ncol(soybean)]

y = soybean[, ncol(soybean)]



