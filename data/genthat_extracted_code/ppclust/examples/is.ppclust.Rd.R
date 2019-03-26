library(ppclust)


### Name: is.ppclust
### Title: Check the class of object for 'ppclust'
### Aliases: is.ppclust

### ** Examples

data(iris)

# Run FCM for 3 clusters
res.fcm <- fcm(x=iris[,1:4], centers=2)

# Test for a ppclust object returned by the fcm function
is.ppclust(res.fcm)

# Test for a matrix object
x <- matrix(nrow=3, ncol=2, c(1,4,2,5,7,8))
is.ppclust(x)



