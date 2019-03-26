library(CrossClustering)


### Name: reverse_table
### Title: Reverse the process of create a contingency table
### Aliases: reverse_table

### ** Examples

clust_1 <- iris[, 1:4] %>% dist() %>% hclust() %>% cutree(k = 3)
clust_2 <- iris[, 1:4] %>% dist() %>% hclust() %>% cutree(k = 4)
cont_table <- table(clust_1, clust_2)

reverse_table(cont_table)



