library(dendextend)


### Name: cut_lower_fun
### Title: Cut a dendrogram - and run a function on the output
### Aliases: cut_lower_fun dendextend_cut_lower_fun

### ** Examples


dend = as.dendrogram(hclust(dist(iris[1:4,-5])))
# this is really cool!
cut_lower_fun(dend, .4, labels)
lapply(cut(dend, h = .4)$lower, labels)   
cut_lower_fun(dend, .4, order.dendrogram)


## Not run: 
##D # library(dendextend)
##D library(dendextendRcpp)
##D dend_big = as.dendrogram(hclust(dist(iris[1:150,-5])))
##D library(microbenchmark)
##D microbenchmark(old_cut_lower_fun(dend_big,.1),
##D                dendextendRcpp::dendextendRcpp_cut_lower_fun(dend_big,.1),
##D                times = 100)
##D # about 7-15 times faster. It is faster the larger the tree is, and the lower h is.
## End(Not run)




