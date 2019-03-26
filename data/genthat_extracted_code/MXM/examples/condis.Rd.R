library(MXM)


### Name: Conditional independence tests counting the number of times a possible collider d-separates two nodes
### Title: Many conditional independence tests counting the number of times
###   a possible collider d-separates two nodes
### Aliases: condis
### Keywords: Area under the curve receiver operating curve

### ** Examples

x <- rdag2(1000, p = 10, nei = 5)
G <- x$G
dat <- x$x
cs1 <- which(G[6, ] > 0  |  G[, 6] > 0)
cs2 <- which(G[7, ] > 0  |  G[, 7] > 0)
cs1 <- setdiff( cs1, c(7, 3) )
cs2 <- setdiff( cs2, c(6, 3) ) 
condis(6, 7, cs1, cs2, 3, dat, type = "pearson", rob = FALSE, max_k = 3, R = 1 )



