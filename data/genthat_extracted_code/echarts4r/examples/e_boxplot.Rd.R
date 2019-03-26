library(echarts4r)


### Name: e_boxplot
### Title: Boxplot
### Aliases: e_boxplot e_boxplot_

### ** Examples

df <- data.frame(
  x = c(1:10, 25),
  y = c(1:10, -6)
)

df %>% 
  e_charts() %>% 
  e_boxplot(y, outliers = TRUE) %>% 
  e_boxplot(x, outliers = TRUE)




