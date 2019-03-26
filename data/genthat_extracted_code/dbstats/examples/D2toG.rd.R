library(dbstats)


### Name: D2toG
### Title: Distance conversion: D2 to G
### Aliases: D2toG

### ** Examples


X <- matrix(rnorm(100*3),nrow=100)
D2 <- as.matrix(dist(X)^2)
class(D2) <- "D2"
G <- D2toG(D2,weights=NULL)




