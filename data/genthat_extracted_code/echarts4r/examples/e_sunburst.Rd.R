library(echarts4r)


### Name: e_sunburst
### Title: Sunburst
### Aliases: e_sunburst e_sunburst_

### ** Examples

df <- data.frame(
  parent = c("earth", "earth", "earth", "mars", "mars"), 
  child = c("forest", "ocean", "iceberg", "elon", "curiosity"),
  value = ceiling(rnorm(5, 10, 2))
)

df %>% 
  e_charts() %>% 
  e_sunburst(parent, child, value) %>% 
  e_theme("westeros")




