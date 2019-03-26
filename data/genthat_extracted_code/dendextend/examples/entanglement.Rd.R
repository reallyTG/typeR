library(dendextend)


### Name: entanglement
### Title: Measures entanglement between two trees
### Aliases: entanglement entanglement.hclust entanglement.phylo
###   entanglement.dendlist entanglement.dendrogram

### ** Examples


## Not run: 
##D dend1 <- iris[,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D dend12 <- dendlist(dend1, dend2)
##D tanglegram(dend12)
##D 
##D entanglement(dend12)
##D entanglement(dend12, L = 0)
##D entanglement(dend12, L = 0.25)
##D entanglement(dend1,dend2, L = 0) # 1
##D entanglement(dend1,dend2, L = 0.25) # 0.97
##D entanglement(dend1,dend2, L = 1) # 0.93
##D entanglement(dend1,dend2, L = 2) # 0.88
##D 
##D # a somewhat better tanglegram
##D tanglegram(sort(dend1),sort(dend2))
##D # and alos a MUCH better entanglement
##D entanglement(sort(dend1),sort(dend2), L=1.5) # 0.0811
##D # but not that much, for L=0.25
##D entanglement(sort(dend1),sort(dend2), L=.25) # 0.579
##D 
##D 
##D 
##D ##################
##D ##################
##D ##################
##D # massing up the order of leaves is dangerous:
##D entanglement(dend1 , dend2, 1.5, "order") # 0.91
##D order.dendrogram(dend2) <- seq_len(nleaves(dend2))
##D # this 0.95 number is NO LONGER correct!!
##D entanglement(dend1 , dend2, 1.5, "order") # 0.95
##D # but if we use the "labels" method - we still get the correct number:
##D entanglement(dend1 , dend2, 1.5, "labels") # 0.91
##D 
##D # however, we can fix our dend2, as follows:
##D dend2 <- match_order_by_labels(dend2, dend1)
##D # Now that labels and order are matched - entanglement is back at working fine:
##D entanglement(dend1 , dend2, 1.5, "order") # 0.91
##D 
##D 
##D 
## End(Not run)



