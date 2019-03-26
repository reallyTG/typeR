library(FNN)


### Name: knn.dist
### Title: k Nearest Neighbor Distances
### Aliases: knn.dist knnx.dist
### Keywords: manip

### ** Examples

  if(require(mvtnorm))
  {
    sigma<- function(v, r, p)
    {
      	V<- matrix(r^2, ncol=p, nrow=p)
    	  diag(V)<- 1
        V*v
    }

    X<- rmvnorm(1000, mean=rep(0, 20), sigma(1, .5, 20))
    print(system.time(knn.dist(X)) )
    print(system.time(knn.dist(X, algorithm = "kd_tree")))

  }



