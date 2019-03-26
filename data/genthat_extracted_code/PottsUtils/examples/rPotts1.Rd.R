library(PottsUtils)


### Name: rPotts1
### Title: Generate One Random Sample from a Potts Model
### Aliases: rPotts1
### Keywords: distribution

### ** Examples

  ## Not run: 
##D   neighbors <- getNeighbors(matrix(1, 16, 16), c(2,2,0,0))
##D   blocks <- getBlocks(matrix(1, 16, 16), 2)
##D   spatialMat <- matrix(c(2, 0, -1, 0, 2, 0, -1, 0, 2), ncol=3)
##D   mu <- c(22, 70 ,102)
##D   sigma <- c(17, 16, 19)
##D   count <- c(40, 140, 76)
##D   y <- unlist(lapply(1:3, function(i) rnorm(count[i], mu[i], sigma[i])))
##D   external <- do.call(cbind,
##D                       lapply(1:3, function(i) dnorm(y, mu[i],sigma[i])))
##D   current.colors <- rep(1:3, count)
##D   rPotts1(nvertex=16^2, ncolor=3, neighbors=neighbors, blocks=blocks,  
##D           spatialMat=spatialMat, beta=0.3, external=external,
##D           colors=current.colors, algorithm="G")
##D   edges <- getEdges(matrix(1, 16, 16), c(2,2,0,0))
##D   rPotts1(nvertex=16^2, ncolor=3, edges=edges, beta=0.3,
##D           external=external, colors=current.colors, algorithm="P")
##D  
## End(Not run)



