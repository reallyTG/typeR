library(echarts4r)


### Name: e_tree
### Title: Tree
### Aliases: e_tree e_tree_

### ** Examples

df <- data.frame(
  parent = c("earth","earth","forest","forest","ocean","ocean","ocean","ocean"), 
  child = c("ocean","forest","tree","sasquatch","fish","seaweed","mantis shrimp","sea monster")
)

df %>% 
  e_charts() %>% 
  e_tree(parent, child)




