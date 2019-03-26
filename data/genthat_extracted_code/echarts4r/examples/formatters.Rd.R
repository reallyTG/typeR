library(echarts4r)


### Name: e_format_axis
### Title: Formatters
### Aliases: e_format_axis e_format_x_axis e_format_y_axis

### ** Examples

# Y = %
df <- data.frame(
  x = 1:10,
  y = round(
    runif(10, 1, 100), 2
  ) 
)

df %>% 
  e_charts(x) %>% 
  e_line(y) %>% 
  e_format_y_axis(suffix = "%") %>%
  e_format_x_axis(prefix = "A") 




