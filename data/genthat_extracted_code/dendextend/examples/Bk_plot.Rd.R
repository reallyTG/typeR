library(dendextend)


### Name: Bk_plot
### Title: Bk plot - ploting the Fowlkes-Mallows Index of two dendrogram
###   for various k's
### Aliases: Bk_plot

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
##D Bk_plot(hc1, hc2, k = 2:20, xlim = c(2,149))
##D Bk_plot(hc1, hc2)
##D 
##D Bk_plot(hc1, hc2, k = 3)
##D Bk_plot(hc1, hc2, k = 3:10)
##D Bk_plot(hc1, hc2)
##D Bk_plot(hc1, hc2,p.adjust.methods="bonferroni") # higher rejection lines
##D 
##D # this one can take a bit of time:
##D Bk_plot(hc1, hc2, rejection_line_permutation=TRUE, 
##D k_permutation = c(2,4,6,8,10,20,30,40,50), R= 100) 
##D # we can see that the permutation line is VERY close to the asymptotic line.
##D # This is great since it means one can often use the asymptotic results
##D # Without having to do many simulations.
##D 
##D # works just as well for dendrograms:
##D dend1 <- as.dendrogram(hc1)
##D dend2 <- as.dendrogram(hc2)
##D Bk_plot(dend1, dend2, k = 2:3, try_cutree_hclust = FALSE) # slower than hclust, but works...
##D Bk_plot(hc1, dend2, k = 2:3, try_cutree_hclust = FALSE) # slower than hclust, but works...
##D Bk_plot(dend1, dend1, k = 2:3, try_cutree_hclust = TRUE) # slower than hclust, but works...
##D Bk_plot(hc1, hc1, k = 2:3) # slower than hclust, but works...
##D # for some reason it can't turn dend2 back to hclust :(
##D a= Bk_plot(hc1, hc2, k = 2:3, try_cutree_hclust = TRUE) # slower than hclust, but works...
##D 
##D hc1_mixed <- as.hclust(sample(as.dendrogram(hc1)))
##D Bk_plot(tree1=hc1, tree2=hc1_mixed, 
##D         add_E=FALSE,        
##D         rejection_line_permutation=TRUE, k_permutation = c(2,4,6,8,10,20,30,40,50), R= 100) 
##D 
##D 
##D 
## End(Not run)



