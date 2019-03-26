library(dendextend)


### Name: cor_common_nodes
### Title: Proportion of commong nodes between two trees
### Aliases: cor_common_nodes

### ** Examples


set.seed(23235)
ss <- sample(1:150, 10 )
hc1 <- iris[ss,-5] %>% dist %>% hclust("com")
hc2 <- iris[ss,-5] %>% dist %>% hclust("single")
dend1 <- as.dendrogram(hc1)
dend2 <- as.dendrogram(hc2)

cor_cophenetic(dend1, dend2)
cor_common_nodes(dend1, dend2)
tanglegram(dend1, dend2) 
# we can see we have only two nodes which are different...




