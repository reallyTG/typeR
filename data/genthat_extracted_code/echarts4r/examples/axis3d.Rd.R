library(echarts4r)


### Name: e_axis_3d
### Title: Axis 3D
### Aliases: e_axis_3d e_x_axis_3d e_y_axis_3d e_z_axis_3d

### ** Examples

# phony data
v <- LETTERS[1:10]
matrix <- data.frame(
  x = sample(v, 300, replace = TRUE), 
  y = sample(v, 300, replace = TRUE), 
  z1 = rnorm(300, 10, 1),
  z2 = rnorm(300, 10, 1),
  stringsAsFactors = FALSE
) %>% 
  dplyr::group_by(x, y) %>% 
  dplyr::summarise(
    z1 = sum(z1),
    z2 = sum(z2)
  ) %>% 
  dplyr::ungroup() 
  
trans <- list(opacity = 0.4) # transparency
emphasis <- list(itemStyle = list(color = "#313695"))
  
matrix %>% 
  e_charts(x) %>% 
  e_bar_3d(y, z1, stack = "stack", name = "Serie 1", itemStyle = trans, emphasis = emphasis) %>%
  e_bar_3d(y, z2, stack = "stack", name = "Serie 2", itemStyle = trans, emphasis = emphasis) %>% 
  e_x_axis_3d(axisLine = list(lineStyle = list(color = "blue")))




