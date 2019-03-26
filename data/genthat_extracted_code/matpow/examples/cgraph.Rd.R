library(matpow)


### Name: cgraph
### Title: Callback Examples
### Aliases: cgraph eig mc mexp

### ** Examples

## Not run: 
##D m <- rbind(c(1,0,0,1),c(1,0,1,1),c(0,1,0,0),c(0,0,1,1))
##D ev <- matpow(m,callback=cgraph,mindist=T)
##D ev$connected  # prints TRUE
##D ev$dists  # prints, e.g. that min dist from 1 to 2 is 3
##D m <- rbind(1:2,3:4)
##D # allow for 1000 iterations max
##D ev <- matpow(m,1000,callback=eig,squaring=TRUE)
##D # how many iterations did we actually need?
##D ev$i  # only 8
##D ev$x  # prints eigenvec; check by calling R's eigen()
## End(Not run)



