library(echarts4r)


### Name: e_treemap
### Title: Treemap
### Aliases: e_treemap e_treemap_

### ** Examples

df <- data.frame(
  parent = c("earth", "earth", "earth", "mars", "mars"), 
  child = c("forest", "ocean", "iceberg", "elon", "curiosity"),
  value = ceiling(rnorm(5, 10, 2))
)

df %>% 
  e_charts() %>% 
  e_treemap(parent, child, value)
  



