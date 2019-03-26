library(snipEM)


### Name: skmeans
### Title: Snipped k-means clustering with cellwise outliers
### Aliases: skmeans

### ** Examples

## Not run: 
##D X <- matrix(NA,1000,5)
##D # two clusters
##D k <- 2
##D X[1:500,] <- rnorm(500*5)
##D X[501:1000,] <- rnorm(500*5,15)
##D clust <- rep(c(1,2), each=500)
##D 
##D # 5% cellwise outliers
##D s <- sample(1000*5,1000*5*0.05)
##D X[s] <- runif(1000*5*0.05,-100,100)
##D V <- X
##D V[s] <- 0
##D V[-s] <- 1
##D 
##D # Initial V and R
##D Vinit <- matrix(1, nrow(X), ncol(X))
##D Vinit[which(X > quantile(X,0.975) | X < quantile(X,0.025))] <- 0
##D km <- kmeans(X,k)
##D clustinit <- km$clust
##D 
##D # Snipped robust clustering
##D skm <- skmeans(X, k, Vinit, clustinit)
##D 
##D table(clust,km$clust)
##D table(clust,skm$clust)
## End(Not run)



