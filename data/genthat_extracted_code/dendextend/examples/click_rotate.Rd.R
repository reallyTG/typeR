library(dendextend)


### Name: click_rotate
### Title: Interactively rotate a tree object
### Aliases: click_rotate click_rotate.default click_rotate.dendrogram

### ** Examples

# create the dend:
dend <- USArrests %>% dist %>% hclust("ave") %>%  
as.dendrogram %>% color_labels

## Not run: 
##D # play with the rotation once
##D dend <- click_rotate(dend)
##D dend <- click_rotate(dend, horiz = TRUE)
##D # keep playing with the rotation:
##D while(TRUE) dend <- click_rotate(dend)
##D # the same as
##D dend <- click_rotate(dend, continue = TRUE)
## End(Not run)




