library(energy)


### Name: kgroups
### Title: K-Groups Clustering
### Aliases: kgroups
### Keywords: cluster multivariate

### ** Examples

  x <- as.matrix(iris[ ,1:4])
  set.seed(123)
  kg <- kgroups(x, k = 3, iter.max = 5, nstart = 2)
  kg
  fitted(kg)
  
  ## No test: 
    d <- dist(x)
    set.seed(123)
    kg <- kgroups(d, k = 3, iter.max = 5, nstart = 2)
    kg
    
    kg$cluster
  
    fitted(kg)
    fitted(kg, method = "groups")
    
## End(No test)



