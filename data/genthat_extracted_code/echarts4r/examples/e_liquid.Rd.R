library(echarts4r)


### Name: e_liquid
### Title: Liquid fill
### Aliases: e_liquid e_liquid_

### ** Examples

df <- data.frame(val = c(0.6, 0.5, 0.4))

df %>% 
  e_charts() %>% 
  e_liquid(val) %>% 
  e_theme("dark")




