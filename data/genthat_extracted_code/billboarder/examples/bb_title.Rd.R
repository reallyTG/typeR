library(billboarder)


### Name: bb_title
### Title: Add title to Billboard.js chart
### Aliases: bb_title

### ** Examples

billboarder() %>% 
  bb_barchart(data = table(sample(letters, 100, TRUE))) %>% 
  bb_title(text = "Random letters", position = "center")




