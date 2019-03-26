library(dendextend)


### Name: Bk_permutations
### Title: Bk permutation - Calculating Fowlkes-Mallows Index for two
###   dendrogram
### Aliases: Bk_permutations

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- TRUE # sample(1:150, 10 )
##D hc1 <- hclust(dist(iris[ss,-5]), "com")
##D hc2 <- hclust(dist(iris[ss,-5]), "single")
##D # tree1 <- as.treerogram(hc1)
##D # tree2 <- as.treerogram(hc2)
##D #    cutree(tree1)   
##D 
##D some_Bk <- Bk(hc1, hc2, k = 20)
##D some_Bk_permu <- Bk_permutations(hc1, hc2, k = 20)
##D 
##D # we can see that the Bk is much higher than the permutation Bks: 
##D plot(x=rep(1,1000), y= some_Bk_permu[[1]], 
##D         main = "Bk distribution under H0",
##D         ylim = c(0,1))
##D points(1, y= some_Bk, pch = 19, col = 2 )
##D 
## End(Not run)



