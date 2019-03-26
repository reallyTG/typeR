library(orclus)


### Name: predict.orclus
### Title: Arbitrarily ORiented projected CLUSter generation
### Aliases: predict.orclus
### Keywords: cluster classif multivariate

### ** Examples

# generate simple artificial example of two clusters
clus1.v1 <- runif(100)
clus2.v1 <- runif(100) 
xample <- rbind(cbind(clus1.v1, 0.5 - clus1.v1), cbind(clus2.v1, -0.5 + clus2.v1))

orclus.res <- orclus(x = xample, k = 2, l = 1, k0 = 8, a = 0.5)

# generate new data and predict it using the 
newclus1.v1 <- runif(100)
newclus2.v1 <- runif(100) 
true.clusterids  <- rep(1:2, each = 100)
xample2 <- rbind(cbind(newclus1.v1, 0.5 - newclus1.v1), 
                 cbind(newclus2.v1, -0.5 + newclus2.v1))

orclus.prediction <- predict(orclus.res, xample2)
table(orclus.prediction$cluster, true.clusterids)




