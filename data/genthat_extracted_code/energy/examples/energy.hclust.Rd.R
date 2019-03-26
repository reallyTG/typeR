library(energy)


### Name: energy.hclust
### Title: Hierarchical Clustering by Minimum (Energy) E-distance
### Aliases: energy.hclust
### Keywords: multivariate cluster

### ** Examples

   ## Not run: 
##D    library(cluster)
##D    data(animals)
##D    plot(energy.hclust(dist(animals)))
##D 
##D    data(USArrests)
##D    ecl <- energy.hclust(dist(USArrests))
##D    print(ecl)
##D    plot(ecl)
##D    cutree(ecl, k=3)
##D    cutree(ecl, h=150)
##D 
##D    ## compare performance of e-clustering, Ward's method, group average method
##D    ## when sampled populations have equal means: n=200, d=5, two groups
##D    z <- rbind(matrix(rnorm(1000), nrow=200), matrix(rnorm(1000, 0, 5), nrow=200))
##D    g <- c(rep(1, 200), rep(2, 200))
##D    d <- dist(z)
##D    e <- energy.hclust(d)
##D    a <- hclust(d, method="average")
##D    w <- hclust(d^2, method="ward.D2")
##D    list("E" = table(cutree(e, k=2) == g), "Ward" = table(cutree(w, k=2) == g),
##D     "Avg" = table(cutree(a, k=2) == g))
##D   
## End(Not run)
 


