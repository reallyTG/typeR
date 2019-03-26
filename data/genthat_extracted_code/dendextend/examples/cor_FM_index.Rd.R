library(dendextend)


### Name: cor_FM_index
### Title: Correlation of FM_index for some k
### Aliases: cor_FM_index

### ** Examples


set.seed(23235)
ss <- sample(1:150, 10 )
hc1 <- iris[ss,-5] %>% dist %>% hclust("com")
hc2 <- iris[ss,-5] %>% dist %>% hclust("single")
dend1 <- as.dendrogram(hc1)
dend2 <- as.dendrogram(hc2)

cor_FM_index(dend1, dend2, k = 2)
cor_FM_index(dend1, dend2, k = 3)
cor_FM_index(dend1, dend2, k = 4)




