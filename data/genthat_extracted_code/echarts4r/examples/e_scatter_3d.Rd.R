library(echarts4r)


### Name: e_scatter_3d
### Title: Scatter 3D
### Aliases: e_scatter_3d e_scatter_3d_

### ** Examples

v <- LETTERS[1:10]
matrix <- data.frame(
  x = sample(v, 300, replace = TRUE), 
  y = sample(v, 300, replace = TRUE), 
  z = rnorm(300, 10, 1),
  color = rnorm(300, 10, 1),
  size = rnorm(300, 10, 1),
  stringsAsFactors = FALSE
) %>% 
  dplyr::group_by(x, y) %>% 
  dplyr::summarise(
    z = sum(z),
    color = sum(color),
    size = sum(size)
  ) %>% 
  dplyr::ungroup() 
  
matrix %>% 
  e_charts(x) %>% 
  e_scatter_3d(y, z, size, color) %>% 
  e_visual_map(
    min = 1, max = 100,
    inRange = list(symbolSize = c(1, 30)), # scale size
    dimension = 3 # third dimension 0 = x, y = 1, z = 2, size = 3
  ) %>% 
  e_visual_map(
    min = 1, max = 100,
    inRange = list(color = c('#bf444c', '#d88273', '#f6efa6')), # scale colors
    dimension = 4, # third dimension 0 = x, y = 1, z = 2, size = 3, color = 4
    bottom = 300 # padding to avoid visual maps overlap
  )
  
airports <- read.csv(
  paste0("https://raw.githubusercontent.com/plotly/datasets/",
         "master/2011_february_us_airport_traffic.csv")
)

airports %>% 
  e_charts(long) %>% 
  e_globe(
    environment = e_stars_texture(),
    base.texture = e_globe_texture(), 
    globeOuterRadius = 100
  ) %>% 
  e_scatter_3d(lat, cnt, coord.system = "globe", blendMode = 'lighter') %>% 
  e_visual_map(inRange = list(symbolSize = c(1, 10)))




