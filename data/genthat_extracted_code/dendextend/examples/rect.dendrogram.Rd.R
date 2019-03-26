library(dendextend)


### Name: rect.dendrogram
### Title: Draw Rectangles Around a Dendrogram's Clusters
### Aliases: rect.dendrogram

### ** Examples


set.seed(23235)
ss <- sample(1:150, 10 )
hc <- iris[ss,-5] %>% dist %>% hclust
dend <- hc %>% as.dendrogram

plot(dend)
rect.dendrogram(dend,2, border = 2)
rect.dendrogram(dend,3, border = 4)
Vectorize(rect.dendrogram, "k")(dend,4:5, border = 6)

plot(dend)
rect.dendrogram(dend, 3 , border = 1:3, 
         density = 2, text = c("1", "b", "miao"), text_cex = 3)
         
plot(dend)
rect.dendrogram(dend,4, which = c(1,3), border = c(2,3))
rect.dendrogram(dend,4, x = 5, border = c(4))
rect.dendrogram(dend,3, border = 3, lwd = 2, lty = 2)
# now THIS, you can not do with the old rect.hclust
plot(dend, horiz = TRUE)
rect.dendrogram(dend,2, border = 2, horiz = TRUE)
rect.dendrogram(dend,4, border = 4, lty = 2, lwd = 3, horiz = TRUE)

# This had previously failed since it worked with a wrong k.

   dend15 <- c(1:5) %>% dist %>% hclust(method = "average") %>% as.dendrogram
   # dend15 <- c(1:25) %>% dist %>% hclust(method = "average") %>% as.dendrogram
   dend15 %>% set("branches_k_color") %>% plot
   dend15 %>% rect.dendrogram(k=3, 
                              border = 8, lty = 5, lwd = 2)



