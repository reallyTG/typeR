library(c3)


### Name: xAxis
### Title: C3 Axis
### Aliases: xAxis xAxis.c3 yAxis yAxis.c3 y2Axis y2Axis.c3

### ** Examples

data.frame(a=c(1,2,3,2),b=c(2,3,1,5)) %>%
  c3(axes = list(a = 'y',
                 b = 'y2')) %>%
   xAxis(label = list(text = 'testing',
                      position = 'inner-center')) %>%
   y2Axis()




