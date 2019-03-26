library(dendextend)


### Name: cor_cophenetic
### Title: Cophenetic correlation between two trees
### Aliases: cor_cophenetic cor_cophenetic.default cor_cophenetic.dendlist

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D hc1 <- iris[ss,-5] %>% dist %>% hclust("com")
##D hc2 <- iris[ss,-5] %>% dist %>% hclust("single")
##D dend1 <- as.dendrogram(hc1)
##D dend2 <- as.dendrogram(hc2)
##D #    cutree(dend1)   
##D 
##D cophenetic(hc1)
##D cophenetic(hc2)
##D # notice how the dist matrix for the dendrograms have different orders:
##D cophenetic(dend1)
##D cophenetic(dend2)
##D 
##D cor(cophenetic(hc1), cophenetic(hc2)) # 0.874
##D cor(cophenetic(dend1), cophenetic(dend2))  # 0.16
##D # the difference is becasue the order of the distance table in the case of
##D # stats:::cophenetic.dendrogram will change between dendrograms!
##D 
##D # however, this is consistant (since I force-sort the rows/columns): 
##D cor_cophenetic(hc1, hc2)
##D cor_cophenetic(dend1, dend2)
##D 
##D cor_cophenetic(dendlist(dend1, dend2))
##D 
##D # we can also use different cor methods (almost the same result though): 
##D cor_cophenetic(hc1, hc2, method = "spearman") # 0.8456014
##D cor_cophenetic(dend1, dend2, method = "spearman") # 
##D 
##D 
##D # cophenetic correlation is about 10 times (!) faster than bakers_gamma cor:
##D library(microbenchmark)
##D microbenchmark(
##D    cor_bakers_gamma = cor_bakers_gamma(dend1, dend2, try_cutree_hclust=FALSE),
##D    cor_cophenetic = cor_cophenetic(dend1, dend2)   ,
##D    times=10
##D )
##D 
##D # but only because of the cutree for dendrogram. When allowing hclust cutree
##D # it is only about twice as fast:
##D microbenchmark(
##D    cor_bakers_gamma = cor_bakers_gamma(dend1, dend2, try_cutree_hclust=TRUE),
##D    cor_cophenetic = cor_cophenetic(dend1, dend2)   ,
##D    times=10
##D )
##D 
## End(Not run)




