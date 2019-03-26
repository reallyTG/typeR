library(orclus)


### Name: orclus
### Title: Arbitrarily ORiented projected CLUSter generation
### Aliases: orclus orclus.default print.orclus
### Keywords: cluster classif multivariate

### ** Examples

# generate simple artificial example of two clusters
clus1.v1 <- runif(100)
clus2.v1 <- runif(100) 
xample <- rbind(cbind(clus1.v1, 0.5 - clus1.v1), cbind(clus2.v1, -0.5 + clus2.v1))
plot(xample, col=rep(1:2, each=100))

# try standard kmeans clustering
kmeans.res <- kmeans(xample, 2)
plot(xample, col = kmeans.res$cluster)

# use orclus instead 
orclus.res <- orclus(x = xample, k = 2, l = 1, k0 = 8, a = 0.5)
plot(xample, col = orclus.res$cluster)

# show data in cluster-specific subspaces
par(mfrow=c(1,2))
for(i in 1:length(orclus.res$size)) plot(xample %*% orclus.res$subspaces[[i]], 
    col = orclus.res$cluster, ylab = paste("Identified subspace for cluster",i))


### second 'more multivariate' example to play with...

# definition of a function for parameterized data simulation
sim.orclus <- function(k = 3, nk = 100, d = 10, l = 4, 
                       sd.cl = 0.05, sd.rest = 1, locshift = 1){
  ### input parameters for data generation
  # k           number of clusters
  # nk          observations per cluster
  # d           original dimension of the data
  # l           subspace dimension where the clusters are concentrated
  # sd.cl       (within cluster subspace) standard deviations for data generation 
  # sd.rest     standard deviations in the remaining space 
  # locshift    parameter of a uniform distribution to sample different cluster means  

  x <- NULL
  for(i in 1:k){
  # cluster centers
  apts <- locshift*matrix(runif(l*k), ncol = l)  
  # sample points in original space
  xi.original <- cbind(matrix(rnorm(nk * l, sd = sd.cl), ncol=l) + matrix(rep(apts[i,], nk), 
                              ncol = l, byrow = TRUE),
                       matrix(rnorm(nk * (d-l), sd = sd.rest), ncol = (d-l)))  
  # subspace generation
  sym.mat <- matrix(nrow=d, ncol=d)
  for(m in 1:d){
    for(n in 1:m){
      sym.mat[m,n] <- sym.mat[n,m] <- runif(1)  
      }
    } 
  subspace <- eigen(sym.mat)$vectors    
  # transformation
  xi.transformed <- xi.original %*% subspace
  x <- rbind(x, xi.transformed)
  }  
  clids <- rep(1:k, each = nk)
  result <- list(x = x, cluster = clids)
  return(result)
  }

# simulate data, you can play with different parameterizations...
simdata <- sim.orclus(k = 3, nk = 200, d = 15, l = 4, 
                      sd.cl = 0.05, sd.rest = 1, locshift = 1)

# apply kmeans and orclus
kmeans.res2 <- kmeans(simdata$x, 3)
orclus.res2 <- orclus(x = simdata$x, k = 3, l = 4, k0 = 15, a = 0.75)
cat("SC: ", orclus.res2$sparsity.coefficient, "\n")

# compare results
table(kmeans.res2$cluster, simdata$cluster)
table(orclus.res2$cluster, simdata$cluster)



