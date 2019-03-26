library(echarts4r)


### Name: e_theme
### Title: Themes
### Aliases: e_theme e_theme_custom

### ** Examples

mtcars %>% 
  e_charts(mpg) %>%
  e_line(disp) %>% 
  e_area(hp) %>% 
  e_x_axis(min = 10) -> p
  
p %>% e_theme("chalk")
p %>% e_theme_custom('{"color":["#ff715e","#ffaf51"]}')




