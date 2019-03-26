library(dendextend)


### Name: tanglegram
### Title: Tanglegram plot
### Aliases: tanglegram tanglegram.default tanglegram.hclust
###   tanglegram.phylo tanglegram.dendlist tanglegram.dendrogram
###   dendbackback

### ** Examples

## Not run: 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D dend12 <- dendlist(dend1, dend2)
##D 
##D dend12 %>% tanglegram
##D 
##D tanglegram(dend1 , dend2)
##D tanglegram(dend1 , dend2, sort = TRUE)
##D tanglegram(dend1 , dend2, remove_nodePar = TRUE)
##D tanglegram(dend1 , dend2, k_labels = 6, k_branches = 4)
##D 
##D tanglegram(dend1 , dend2, lab.cex = 2, edge.lwd = 3,
##D margin_inner= 5, type = "t", center = TRUE)
##D 
##D 
##D ## works nicely:
##D tanglegram(dend1 , dend2, lab.cex = 2, edge.lwd = 3,  
##D margin_inner= 3.5, type = "t", center = TRUE,
##D dLeaf = -0.1, xlim = c(7,0),
##D k_branches=3)
##D 
##D 
##D # using rank_branches can make the comparison even easier
##D tanglegram(rank_branches(dend1) , rank_branches(dend2), lab.cex = 2, edge.lwd = 3,  
##D  margin_inner= 3.5, type = "t", center = TRUE,
##D   dLeaf = -0.1, xlim = c(5.1,0), columns_width= c(5,1,5),
##D    k_branches=3)
##D 
##D 
##D 
##D ########
##D ## Nice example of some colored trees
##D 
##D # see the coloring of common sub trees:
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D dend12 <- dendlist(dend1, dend2)
##D # dend12 %>% untangle %>% tanglegram
##D dend12 %>% tanglegram(common_subtrees_color_branches = TRUE)
##D 
##D 
##D set.seed(22133513)
##D ss <- sample(1:150, 10 )
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D dend12 <- dendlist(dend1, dend2)
##D # dend12 %>% untangle %>% tanglegram
##D dend12 %>% tanglegram(common_subtrees_color_branches = TRUE)
##D dend12 %>% tanglegram
##D 
## End(Not run)



