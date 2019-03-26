library(spatstat)


### Name: rPoissonCluster
### Title: Simulate Poisson Cluster Process
### Aliases: rPoissonCluster
### Keywords: spatial datagen

### ** Examples

  # each cluster consist of 10 points in a disc of radius 0.2
  nclust <- function(x0, y0, radius, n) {
              return(runifdisc(n, radius, centre=c(x0, y0)))
            }
  plot(rPoissonCluster(10, 0.2, nclust, radius=0.2, n=5))

  # multitype Neyman-Scott process (each cluster is a multitype process)
  nclust2 <- function(x0, y0, radius, n, types=c("a", "b")) {
     X <- runifdisc(n, radius, centre=c(x0, y0))
     M <- sample(types, n, replace=TRUE)
     marks(X) <- M
     return(X)
  }
  plot(rPoissonCluster(15,0.1,nclust2, radius=0.1, n=5))



