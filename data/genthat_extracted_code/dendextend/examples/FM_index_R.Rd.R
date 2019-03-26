library(dendextend)


### Name: FM_index_R
### Title: Calculating Fowlkes-Mallows index in R
### Aliases: FM_index_R

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- TRUE # sample(1:150, 10 )
##D hc1 <- hclust(dist(iris[ss,-5]), "com")
##D hc2 <- hclust(dist(iris[ss,-5]), "single")
##D # dend1 <- as.dendrogram(hc1)
##D # dend2 <- as.dendrogram(hc2)
##D #    cutree(dend1)   
##D 
##D FM_index_R(cutree(hc1, k=3), cutree(hc1, k=3)) # 1
##D set.seed(1341)
##D FM_index_R(cutree(hc1, k=3), sample(cutree(hc1, k=3)), assume_sorted_vectors =TRUE) # 0.38037
##D FM_index_R(cutree(hc1, k=3), sample(cutree(hc1, k=3)), assume_sorted_vectors =FALSE) # 1 again :)
##D FM_index_R(cutree(hc1, k=3), cutree(hc2, k=3)) # 0.8059
##D FM_index_R(cutree(hc1, k=30), cutree(hc2, k=30)) # 0.4529
##D 
##D fo <- function(k) FM_index_R(cutree(hc1, k), cutree(hc2, k)) 
##D lapply(1:4, fo)
##D ks <- 1:150
##D plot(sapply(ks, fo)~ ks, type = "b", main = "Bk plot for the iris dataset")
##D 
##D clu_1 <- cutree(hc2, k = 100) # this is a lie - since this one is NOT well defined!
##D clu_2 <- cutree(as.dendrogram(hc2), k = 100) # We see that we get a vector of NAs for this...
##D 
##D FM_index_R(clu_1, clu_2) # NA
##D 
## End(Not run)



