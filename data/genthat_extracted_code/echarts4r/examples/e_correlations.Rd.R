library(echarts4r)


### Name: e_correlations
### Title: Correlation
### Aliases: e_correlations

### ** Examples

cor(mtcars) %>% 
  e_charts() %>% 
  e_correlations(
    order = "hclust",
    visual_map = FALSE
  ) %>% 
  e_visual_map(
   min = -1, 
   max = 1
  )




