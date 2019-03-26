library(echarts4r)


### Name: e_scatter_gl
### Title: Scatter GL
### Aliases: e_scatter_gl e_scatter_gl_

### ** Examples

quakes %>% 
  e_charts(long) %>% 
  e_geo(
    roam = TRUE,
    boundingCoords = list(
      c(185, - 10),
      c(165, -40)
     )
  ) %>% 
  e_scatter_gl(lat, depth)




