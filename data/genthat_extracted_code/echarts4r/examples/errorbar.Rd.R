library(echarts4r)


### Name: e_error_bar
### Title: Error bar
### Aliases: e_error_bar e_error_bar_

### ** Examples

df <- data.frame(
  x = factor(c(1, 2)),
  y = c(1, 5),
  upper = c(1.1, 5.3),
  lower = c(0.8, 4.6)
)

df %>% 
  e_charts(x) %>% 
  e_bar(y) %>% 
  e_error_bar(lower, upper)
  
# timeline
df <- data.frame(
  x = factor(c(1, 1, 2, 2)),
  y = c(1, 5, 3, 4),
  step = factor(c(1, 2, 1, 2)),
  upper = c(1.1, 5.3, 3.3, 4.2),
  lower = c(0.8, 4.6, 2.4, 3.6)
)

df %>% 
  group_by(step) %>% 
  e_charts(x, timeline = TRUE) %>% 
  e_bar(y) %>% 
  e_error_bar(lower, upper)




