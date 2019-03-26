library(dendextend)


### Name: color_labels
### Title: Color dend's labels according to sub-clusters
### Aliases: color_labels colour_labels

### ** Examples


## Not run: 
##D hc <- hclust(dist(USArrests), "ave")
##D dend <- as.dendrogram(hc)
##D dend=color_labels(dend,5, col = c(3,1,1,4,1))
##D dend=color_branches(dend,5, col = c(3,1,1,4,1))
##D plot(dend) # selective coloring of branches AND labels :)
##D 
##D # coloring some labels, based on label names:
##D dend=color_labels(dend,col = "red", labels = labels(dend)[c(4,16)]) 
##D plot(dend) # selective coloring of branches AND labels :)
##D 
##D d5=color_branches(dend,5)
##D plot(d5)
##D d5g=color_branches(dend,5,groupLabels=TRUE)
##D plot(d5g)
##D d5gr=color_branches(dend,5,groupLabels=as.roman)
##D plot(d5gr)
##D 
## End(Not run) 




