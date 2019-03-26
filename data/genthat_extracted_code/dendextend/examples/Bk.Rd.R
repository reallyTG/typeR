library(dendextend)


### Name: Bk
### Title: Bk - Calculating Fowlkes-Mallows Index for two dendrogram
### Aliases: Bk

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- TRUE # sample(1:150, 10 )
##D hc1 <- hclust(dist(iris[ss,-5]), "com")
##D hc2 <- hclust(dist(iris[ss,-5]), "single")
##D tree1 <- as.dendrogram(hc1)
##D tree2 <- as.dendrogram(hc2)
##D #    cutree(tree1)   
##D 
##D Bk(hc1, hc2, k = 3)
##D Bk(hc1, hc2, k = 2:10)
##D Bk(hc1, hc2)
##D 
##D Bk(tree1, tree2, k = 3)
##D Bk(tree1, tree2, k = 2:5)
##D 
##D system.time(Bk(hc1, hc2, k = 2:5)) # 0.01
##D system.time(Bk(hc1, hc2)) # 1.28
##D system.time(Bk(tree1, tree2, k = 2:5)) # 0.24 # after fixes.
##D system.time(Bk(tree1, tree2, k = 2:10)) # 0.31 # after fixes.
##D system.time(Bk(tree1, tree2)) # 7.85 
##D Bk(tree1, tree2, k= 99:101)
##D 
##D y <- Bk(hc1, hc2, k = 2:10)
##D plot(unlist(y)~c(2:10), type = "b", ylim = c(0,1))
##D 
##D # can take a few seconds
##D y <- Bk(hc1, hc2)
##D plot(unlist(y)~as.numeric(names(y)), 
##D      main = "Bk plot", pch = 20,
##D      xlab = "k", ylab = "FM Index",
##D      type = "b", ylim = c(0,1))
##D # we are still missing some hypothesis testing here.
##D # for this we'll have the Bk_plot function.
##D 
## End(Not run)



