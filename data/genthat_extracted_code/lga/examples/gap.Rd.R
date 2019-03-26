library(lga)


### Name: gap
### Title: Perform gap analysis
### Aliases: gap gap.default
### Keywords: multivariate cluster

### ** Examples


## Synthetic example
## Make a dataset with 2 clusters in 2 dimensions

library(MASS)
set.seed(1234)
X <- rbind(mvrnorm(n=100, mu=c(1, -2), Sigma=diag(0.1, 2) + 0.9),
           mvrnorm(n=100, mu=c(1, 1), Sigma=diag(0.1, 2) + 0.9))

gap(X, K=4, B=20)

## to run this using parallel processing with 4 nodes, the equivalent
## code would be

## Not run: gap(X, K=4, B=20, nnode=4)


## Quakes data (from package:datasets)
## Including the first two dimensions versus three dimensions
## yields different results

set.seed(1234)
## Not run: 
##D gap(quakes[,1:2], K=4, B=20)
##D gap(quakes[,1:3], K=4, B=20)
## End(Not run)

library(maps)
lgaout1 <- lga(quakes[,1:2], k=3)
plot(lgaout1)

lgaout2 <- lga(quakes[,1:3], k=2)
plot(lgaout2)

## Let's put this in context
par(mfrow=c(1,2))
map("world", xlim=range(quakes[,2]), ylim=range(quakes[,1])); box()
points(quakes[,2], quakes[,1], pch=lgaout1$cluster, col=lgaout1$cluster)

map("world", xlim=range(quakes[,2]), ylim=range(quakes[,1])); box()
points(quakes[,2], quakes[,1], pch=lgaout2$cluster, col=lgaout2$cluster)




