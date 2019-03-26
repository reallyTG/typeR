library(dbstats)


### Name: GtoD2
### Title: Distance conversion: dist to D2
### Aliases: GtoD2

### ** Examples


X <- matrix(rnorm(100*3),nrow=100)
D2 <- as.matrix(dist(X)^2)
class(D2) <- "D2"
G <- D2toG(D2,weights=NULL)
class(G) <- "Gram"
D22 <- GtoD2(G)





