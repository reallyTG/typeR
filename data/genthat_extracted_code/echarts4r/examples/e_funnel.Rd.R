library(echarts4r)


### Name: e_funnel
### Title: Funnel
### Aliases: e_funnel e_funnel_

### ** Examples

funnel <- data.frame(stage = c("View", "Click", "Purchase"), value = c(80, 30, 20))

funnel %>% 
  e_charts() %>% 
  e_funnel(value, stage)




