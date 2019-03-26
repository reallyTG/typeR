library(cba)


### Name: predict.rock
### Title: Rock Clustering
### Aliases: predict.rock fitted.rock
### Keywords: cluster

### ** Examples

### example from paper
data(Votes)
x <- as.dummy(Votes[-17])
rc <- rockCluster(x, n=2, theta=0.73, debug=TRUE)
rp <- predict(rc, x)
table(rp$cl)



