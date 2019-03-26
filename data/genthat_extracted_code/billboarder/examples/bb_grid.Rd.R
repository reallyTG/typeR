library(billboarder)


### Name: bb_grid
### Title: Grid property for a Billboard.js chart
### Aliases: bb_grid bb_x_grid bb_y_grid

### ** Examples


stars <- data.frame(
  package = c("billboarder", "ggiraph", "officer", "shinyWidgets", "visNetwork"),
  stars = c(1, 176, 42, 40, 166)
)

billboarder() %>%
  bb_barchart(data = stars) %>% 
  bb_y_grid(show = TRUE)

billboarder() %>%
  bb_barchart(data = stars) %>% 
  bb_y_grid(lines = list(list(value = mean(stars$stars), text = "Horizontal line")))




