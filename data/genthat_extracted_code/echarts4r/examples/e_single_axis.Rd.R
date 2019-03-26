library(echarts4r)


### Name: e_single_axis
### Title: Single Axis
### Aliases: e_single_axis

### ** Examples

df <- data.frame(
  axis = LETTERS[1:10],
  value = runif(10, 3, 20),
  size = runif(10, 3, 20)
)

df %>% 
  e_charts(axis) %>% 
  e_single_axis() %>% # add the single axis
  e_scatter(
    value,
    size, 
    coord.system = "singleAxis"
  ) 




