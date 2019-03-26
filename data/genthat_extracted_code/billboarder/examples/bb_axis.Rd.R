library(billboarder)


### Name: bb_axis
### Title: Add axis parameters
### Aliases: bb_axis bb_x_axis bb_y_axis

### ** Examples


stars <- data.frame(
  package = c("billboarder", "ggiraph", "officer", "shinyWidgets", "visNetwork"),
  stars = c(9, 178, 43, 46, 175)
)

# Add a label to y axis
billboarder() %>% 
  bb_barchart(data = stars) %>% 
  bb_axis(y = list(label = list(text = "# of stars", position = "middle")))
  
# or shorter :
billboarder() %>% 
  bb_barchart(data = stars) %>% 
  bb_y_axis(label = list(text = "# of stars", position = "outer-top"))




