library(dendextend)


### Name: cutree
### Title: Cut a Tree (Dendrogram/hclust/phylo) into Groups of Data
### Aliases: cutree cutree.default cutree.hclust cutree.phylo
###   cutree.dendrogram

### ** Examples


## Not run: 
##D hc <- hclust(dist(USArrests[c(1,6,13,20, 23),]), "ave")
##D dend <- as.dendrogram(hc)
##D unbranch_dend <- unbranch(dend,2)
##D 
##D cutree(hc, k=2:4) # on hclust
##D cutree(dend, k=2:4) # on dendrogram
##D 
##D cutree(hc, k=2) # on hclust
##D cutree(dend, k=2) # on dendrogram
##D 
##D cutree(dend, h = c(20, 25.5, 50,170))
##D cutree(hc, h = c(20, 25.5, 50,170))
##D 
##D # the default (ordered by original data's order)
##D cutree(dend, k=2:3, order_clusters_as_data = FALSE) 
##D labels(dend)
##D 
##D # as.hclust(unbranch_dend) # ERROR - can not do this...
##D cutree(unbranch_dend, k = 2) # all NA's
##D cutree(unbranch_dend, k = 1:4)
##D cutree(unbranch_dend, h = c(20, 25.5, 50,170))
##D cutree(dend, h = c(20, 25.5, 50,170))
##D 
##D 
##D library(microbenchmark)
##D ## this shows how as.hclust is expensive - but still worth it if possible
##D microbenchmark(
##D       cutree(hc, k=2:4),
##D       cutree(as.hclust(dend), k=2:4),
##D       cutree(dend, k=2:4),
##D       cutree(dend, k=2:4, try_cutree_hclust=FALSE)
##D    )          
##D          # the dendrogram is MUCH slower...
##D          
##D # Unit: microseconds
##D ##                       expr      min       lq    median        uq       max neval
##D ##        cutree(hc, k = 2:4)   91.270   96.589   99.3885  107.5075   338.758   100
##D ##    tree(as.hclust(dend), 
##D ##			  k = 2:4)           1701.629 1767.700 1854.4895 2029.1875  8736.591   100
##D ##      cutree(dend, k = 2:4) 1807.456 1869.887 1963.3960 2125.2155  5579.705   100
##D ##  cutree(dend, k = 2:4, 
##D ##	try_cutree_hclust = FALSE) 8393.914 8570.852 8755.3490 9686.7930 14194.790   100
##D          
##D # and trying to "hclust" is not expensive (which is nice...)         
##D microbenchmark(
##D   cutree_unbranch_dend = cutree(unbranch_dend, k=2:4),
##D   cutree_unbranch_dend_not_trying_to_hclust = 
##D   cutree(unbranch_dend, k=2:4, try_cutree_hclust=FALSE)
##D )
##D          
##D  
##D ## Unit: milliseconds
##D ##                   expr      min       lq   median       uq      max neval
##D ##cutree_unbranch_dend       7.309329 7.428314 7.494107 7.752234 17.59581   100
##D ##cutree_unbranch_dend_not
##D ##_trying_to_hclust        6.945375 7.079198 7.148629 7.577536 16.99780   100
##D ##There were 50 or more warnings (use warnings() to see the first 50)        
##D                  
##D # notice that if cutree can't find clusters for the desired k/h, it will produce 0's instead!
##D # (It will produce a warning though...)
##D # This is a different behaviout than stats::cutree                        
##D # For example:
##D cutree(as.dendrogram(hclust(dist(c(1,1,1,2,2)))),
##D       k=5)
##D                                          
## End(Not run)





