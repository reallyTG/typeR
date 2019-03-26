library(bcp)


### Name: makeAdjGrid
### Title: Creating the adjacency structure for grid graphs
### Aliases: makeAdjGrid
### Keywords: datasets

### ** Examples

# generates an adjacency list for a 10 node by 5 node grid, assuming a maximum of 8 neighbors
adj <- makeAdjGrid(10, 5) 

# generates an adjacency list for a 10 node by 5 node grid, assuming a maximum of 4 neighbors
adj4 <- makeAdjGrid(10, 5, 4)


### show a grid example
## Not run: 
##D set.seed(5)
##D adj <- makeAdjGrid(20)
##D z <- rep(c(0, 2), each=200)
##D y <- z + rnorm(400, sd=1)
##D out <- bcp(y, adj=adj, burnin=500, mcmc=500)
##D 
##D if (require("ggplot2")) {
##D   df <- data.frame(mean=z, data = y, post.means = out$posterior.mean[,1], 
##D                    post.probs = out$posterior.prob, 
##D                    i = rep(1:20, each=20), j = rep(1:20, times=20))
##D 
##D   # visualize the data
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = data), color='white') +
##D          scale_fill_gradientn(limits=range(y), colours=c('white', 'steelblue'))+
##D          ggtitle("Observed Data")
##D   print(g)
##D 
##D   # visualize the means
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = mean), color='white') +
##D          scale_fill_gradientn(limits=range(y), colours=c('white', 'steelblue'))+
##D          ggtitle("True Means")
##D   print(g)
##D 
##D   # visualize the posterior means/probs
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = post.means), color='white') +
##D          scale_fill_gradientn(limits=range(y), colours=c('white', 'steelblue'))+
##D          ggtitle("Posterior Means")
##D   print(g)
##D 
##D   g <- ggplot(df, aes(i,j)) + 
##D          geom_tile(aes(fill = post.probs), color='white') +
##D          scale_fill_gradientn(limits=c(0, 1), colours=c('white', 'steelblue'))+
##D          ggtitle("Posterior Boundary Probabilities")
##D   print(g)
##D }
## End(Not run)




