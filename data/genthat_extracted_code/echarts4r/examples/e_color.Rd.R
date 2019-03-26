library(echarts4r)


### Name: e_color
### Title: Color
### Aliases: e_color

### ** Examples

mtcars %>% 
  e_charts(drat) %>% 
  e_line(mpg) %>% 
  e_area(qsec) %>% 
  e_color(
    c("red", "blue"),
    "#d3d3d3"
  )
  



