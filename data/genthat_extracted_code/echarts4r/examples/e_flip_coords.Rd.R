library(echarts4r)


### Name: e_flip_coords
### Title: Flip coordinates
### Aliases: e_flip_coords

### ** Examples

df <- data.frame(
  x = LETTERS[1:5],
  y = runif(5, 1, 5),
  z = runif(5, 3, 10)
)

df %>%
 e_charts(x) %>%
 e_bar(y) %>% 
 e_line(z) -> plot
 
plot # normal
e_flip_coords(plot) # flip




