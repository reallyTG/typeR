library(dendextend)


### Name: find_dendrogram
### Title: Search for the subdendrogram structure composed of indicated
###   labels
### Aliases: find_dendrogram

### ** Examples


## Not run: 
##D # define dendrogram object to play with:
##D dend <- iris[,-5] %>% dist %>% hclust %>% as.dendrogram %>%  
##D       set("labels_to_character") %>% color_branches(k=5)
##D first.subdend.only <- cutree(dend, 4) == 1
##D sub.dend <- find_dendrogram(dend, first.subdend.only)
##D # Plotting the result
##D par(mfrow=c(1,2))
##D plot(dend, main = "Original dendrogram")
##D plot(sub.dend, main = "First subdendrogram")
## End(Not run)




