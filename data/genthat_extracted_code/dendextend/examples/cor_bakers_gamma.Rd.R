library(dendextend)


### Name: cor_bakers_gamma
### Title: Baker's Gamma correlation coefficient
### Aliases: cor_bakers_gamma cor_bakers_gamma.dendrogram
###   cor_bakers_gamma.hclust cor_bakers_gamma.dendlist
###   cor_bakers_gamma.default cor_bakers_gamma.dendrogram
###   cor_bakers_gamma.hclust cor_bakers_gamma.dendlist

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D hc1 <- hclust(dist(iris[ss,-5]), "com")
##D hc2 <- hclust(dist(iris[ss,-5]), "single")
##D dend1 <- as.dendrogram(hc1)
##D dend2 <- as.dendrogram(hc2)
##D #    cutree(dend1)   
##D 
##D cor_bakers_gamma(hc1, hc2)
##D cor_bakers_gamma(dend1, dend2)
##D 
##D dend1 <- match_order_by_labels(dend1, dend2) # if you are not sure
##D cor_bakers_gamma(dend1, dend2, use_labels_not_values = FALSE)   
##D 
##D library(microbenchmark)
##D microbenchmark(
##D    with_labels = cor_bakers_gamma(dend1, dend2, try_cutree_hclust=FALSE)   ,
##D    with_values = cor_bakers_gamma(dend1, dend2, 
##D                use_labels_not_values = FALSE, try_cutree_hclust=FALSE)   ,
##D    times=10
##D )
##D 
##D 
##D cor_bakers_gamma(dend1, dend1, use_labels_not_values = FALSE)   
##D cor_bakers_gamma(dend1, dend1, use_labels_not_values = TRUE)   
##D 
## End(Not run)




