library(dbstats)


### Name: D2toDist
### Title: Distance conversion: D2 to dist
### Aliases: D2toDist

### ** Examples


X <- matrix(rnorm(100*3),nrow=100)
distance <- daisy(X,"manhattan")
D2 <- disttoD2(distance)
distance2 <- D2toDist(D2)




