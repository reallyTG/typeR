library(dendextend)


### Name: partition_leaves
### Title: A list with labels for each subtree (edge)
### Aliases: partition_leaves

### ** Examples


x <- 1:3 %>% dist %>% hclust %>% as.dendrogram
plot(x)
partition_leaves(x)

## Not run: 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("single") %>% as.dendrogram
##D 
##D partition_leaves(dend1)
##D partition_leaves(dend2)
## End(Not run)




