library(dendextend)


### Name: FM_index
### Title: Calculating Fowlkes-Mallows Index
### Aliases: FM_index

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
##D FM_index(cutree(hc1, k=3), cutree(hc1, k=3)) # 1 with EV
##D FM_index(cutree(hc1, k=3), cutree(hc1, k=3), include_EV= FALSE) # 1
##D 
##D # checking speed gains
##D library(microbenchmark)
##D  microbenchmark(FM_index(cutree(hc1, k=3), cutree(hc1, k=3)),
##D                  FM_index(cutree(hc1, k=3), cutree(hc1, k=3),
##D                      include_EV= FALSE),
##D                   FM_index(cutree(hc1, k=3), cutree(hc1, k=3),
##D                      include_EV= TRUE, assume_sorted_vectors=TRUE),
##D                   FM_index(cutree(hc1, k=3), cutree(hc1, k=3),
##D                      include_EV= FALSE, assume_sorted_vectors=TRUE)
##D                                                   )
##D # C code is 1.2-1.3 times faster.                                                   
##D                                                   
##D set.seed(1341)
##D FM_index(cutree(hc1, k=3), sample(cutree(hc1, k=3)),
##D    assume_sorted_vectors =TRUE) # 0.38037
##D FM_index(cutree(hc1, k=3), sample(cutree(hc1, k=3)),
##D    assume_sorted_vectors =FALSE) # 1 again :)
##D FM_index(cutree(hc1, k=3), cutree(hc2, k=3)) # 0.8059
##D FM_index(cutree(hc1, k=30), cutree(hc2, k=30)) # 0.4529
##D 
##D fo <- function(k) FM_index(cutree(hc1, k), cutree(hc2, k)) 
##D lapply(1:4, fo)
##D ks <- 1:150
##D plot(sapply(ks, fo)~ ks, type = "b", main = "Bk plot for the iris dataset")
##D 
## End(Not run)



