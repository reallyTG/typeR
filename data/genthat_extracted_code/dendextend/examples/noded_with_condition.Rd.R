library(dendextend)


### Name: noded_with_condition
### Title: Find which nodes satisfies a condition
### Aliases: noded_with_condition

### ** Examples

## Not run: 
##D 
##D library(dendextend)
##D 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D 
##D # Getting the dend dend
##D dend <- iris[ss,-5] %>% dist %>% hclust %>% as.dendrogram
##D dend %>% plot
##D 
##D 
##D 
##D this is the basis for branches_attr_by_labels
##D has_any_labels <- function(sub_dend, the_labels) any(labels(sub_dend) %in% the_labels)
##D cols <- noded_with_condition(dend, has_any_labels,
##D             the_labels = c("126","109", "59")) %>% 
##D             ifelse(2,1)
##D set(dend, "branches_col", cols) %>% plot
##D 
##D # Similar to branches_attr_by_labels - but for heights!
##D high_enough <- function(sub_dend, height) attr(sub_dend, "height") > height
##D cols <- noded_with_condition(dend, high_enough, height = 1) %>% ifelse(2,1)
##D set(dend, "branches_col", cols) %>% plot
##D 
## End(Not run)




