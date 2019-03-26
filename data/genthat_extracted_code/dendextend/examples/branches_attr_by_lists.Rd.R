library(dendextend)


### Name: branches_attr_by_lists
### Title: Change col/lwd/lty of branches from the root down to clusters
###   defined by list of labels of respective members
### Aliases: branches_attr_by_lists

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
##D # define a list of nodes
##D L <- list(c("109", "123", "126", "145"), "29", c("59", "67", "97"))
##D dend %>% 
##D    branches_attr_by_lists(L) %>%
##D    plot
##D 
##D # choose different color, and also change lwd and lty 
##D dend %>% 
##D    branches_attr_by_lists(L, TF_value = "blue") %>%
##D    branches_attr_by_lists(L, attr = "lwd", TF_value = 4) %>%
##D    branches_attr_by_lists(L, attr = "lty", TF_value = 3) %>%
##D    plot
## End(Not run)



