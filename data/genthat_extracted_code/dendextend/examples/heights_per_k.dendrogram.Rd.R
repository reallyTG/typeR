library(dendextend)


### Name: heights_per_k.dendrogram
### Title: Which height will result in which k for a dendrogram
### Aliases: heights_per_k.dendrogram dendextend_heights_per_k.dendrogram

### ** Examples

## Not run: 
##D hc <- hclust(dist(USArrests[1:4,]), "ave")
##D dend <- as.dendrogram(hc)
##D heights_per_k.dendrogram(dend)
##D ##       1        2        3        4 
##D ##86.47086 68.84745 45.98871 28.36531 
##D 
##D cutree(hc, h = 68.8) # and indeed we get 2 clusters
##D 
##D unbranch_dend <- unbranch(dend,2)
##D plot(unbranch_dend)
##D heights_per_k.dendrogram(unbranch_dend)
##D        #1        3        4 
##D        #97.90023 57.41808 16.93594 
##D        # we do NOT have a height for k=2 because of the tree's structure.
##D        
##D    
##D library(microbenchmark)
##D dend = as.dendrogram(hclust(dist(iris[1:150,-5])))
##D dend = as.dendrogram(hclust(dist(iris[1:30,-5])))
##D dend = as.dendrogram(hclust(dist(iris[1:3,-5])))
##D microbenchmark(
##D    #    dendextendRcpp::heights_per_k.dendrogram(dend),
##D    dendextendRcpp::dendextendRcpp_heights_per_k.dendrogram(dend),
##D    dendextendRcpp::old_heights_per_k.dendrogram(dend)
##D )
##D # improvment is 10 times faster (in Rcpp) for a tree of size 3
##D # 76 times faster for a tree of size 30
##D # And:
##D # 134 times faster for a tree of size 150!!
## End(Not run)



