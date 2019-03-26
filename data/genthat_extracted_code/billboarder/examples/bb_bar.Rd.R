library(billboarder)


### Name: bb_bar
### Title: Bar property for a Billboard.js chart
### Aliases: bb_bar

### ** Examples

billboarder() %>%
  bb_barchart(data = data.frame(v1 = c("a", "b", "c"), value = c(5, 6, 3))) %>% 
  bb_bar(width = list(ratio = 0.95))
  



