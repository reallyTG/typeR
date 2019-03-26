library(dendextend)


### Name: set_labels
### Title: Set/place new labels in a dendrogram
### Aliases: set_labels place_labels

### ** Examples


ss <- c(50, 114, 17, 102, 76, 10, 107, 84, 31, 37, 49, 106, 44, 119, 
      104, 145, 67, 85, 12, 77, 22, 136, 38, 135, 70)

   small_iris <- iris[ss, ] 

   small_iris[,-5] %>% 
   dist() %>% 
   hclust(method = "complete") %>%
   as.dendrogram() %>% 
   color_branches(k = 3) %>%  
   color_labels(k = 3) %>% 
   plot()

   # example for using place_labels
   small_iris[,-5] %>% 
      dist() %>% 
      hclust(method = "complete") %>%
      as.dendrogram() %>% 
      color_branches(k = 3) %>%  
      color_labels(k = 3) %>% 
      place_labels(paste(small_iris$Species, 1:25, sep = "_")) %>% 
      plot()
   
   # example for using set_labels
   small_iris[,-5] %>% 
      dist() %>% 
      hclust(method = "complete") %>%
      as.dendrogram() %>% 
      color_branches(k = 3) %>%  
      color_labels(k = 3) %>% 
      set_labels(1:25) %>% 
      plot()




