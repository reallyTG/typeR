library(dendextend)


### Name: branches_attr_by_labels
### Title: Change col/lwd/lty of branches matching labels condition
### Aliases: branches_attr_by_labels

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
##D dend %>% 
##D    branches_attr_by_labels(c("123", "126", "23", "29")) %>%
##D    plot
##D dend %>% 
##D    branches_attr_by_labels(c("123", "126", "23", "29"), "all") %>% 
##D    plot # the same as above
##D dend %>% 
##D    branches_attr_by_labels(c("123", "126", "23", "29"), "any") %>% 
##D    plot
##D 
##D dend %>% 
##D       branches_attr_by_labels(c("123", "126", "23", "29"),
##D       "any", "col", c("blue", "red")) %>% plot
##D dend %>%
##D       branches_attr_by_labels(c("123", "126", "23", "29"),
##D       "any", "lwd", c(4,1)) %>% plot
##D dend %>%
##D       branches_attr_by_labels(c("123", "126", "23", "29"),
##D        "any", "lty", c(2,1)) %>% plot
##D 
## End(Not run)



