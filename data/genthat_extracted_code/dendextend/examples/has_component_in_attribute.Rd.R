library(dendextend)


### Name: has_component_in_attribute
### Title: Does a dendrogram has an edgePar/nodePar component?
### Aliases: has_component_in_attribute has_edgePar has_nodePar

### ** Examples


dat <- iris[1:20,-5]
hca <- hclust(dist(dat))
hca2 <- hclust(dist(dat), method = "single")
dend <- as.dendrogram(hca)
dend2 <- as.dendrogram(hca2)

dend %>% set("branches_lwd", 2) %>% set("branches_lty", 2) %>% plot
dend %>% set("branches_lwd", 2) %>% set("branches_lty", 2) %>% has_edgePar("lty")
dend %>% set("branches_lwd", 2) %>% has_edgePar("lty")
dend %>% set("branches_lwd", 2) %>% has_edgePar("lwd")

dend %>% set("branches_lwd", 2) %>% set("clear_branches") %>% has_edgePar("lwd")




