library(dendextend)


### Name: plot_horiz.dendrogram
### Title: Plotting a left-tip-adjusted horizontal dendrogram
### Aliases: plot_horiz.dendrogram

### ** Examples

## Not run: 
##D dend <- USArrests[1:10,] %>% dist %>% hclust %>% as.dendrogram
##D 
##D par(mfrow =c(1,2), mar = rep(6,4))
##D plot_horiz.dendrogram(dend, side=FALSE) 
##D plot_horiz.dendrogram(dend, side=TRUE) 
##D # plot_horiz.dendrogram(dend, side=TRUE, dLeaf= 0) 
##D # plot_horiz.dendrogram(dend, side=TRUE, nodePar = list(pos = 1)) 
##D # sadly, lab.pos is not implemented yet, 
##D ## so the labels can not be right aligned...
##D 
##D 
##D plot_horiz.dendrogram(dend, side=F)
##D plot_horiz.dendrogram(dend, side=TRUE, dLeaf=0, xlim = c(100,-10)) # bad
##D plot_horiz.dendrogram(dend, side=TRUE, text_offset = 0)
##D plot_horiz.dendrogram(dend, side=TRUE, text_offset = 0,text_pos=4)
##D 
## End(Not run)



