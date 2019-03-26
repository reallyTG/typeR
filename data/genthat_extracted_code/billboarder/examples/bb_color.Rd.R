library(billboarder)


### Name: bb_color
### Title: Color property for a Billboard.js chart
### Aliases: bb_color

### ** Examples


library("RColorBrewer")

# Scatter
billboarder() %>% 
  bb_scatterplot(data = iris, x = "Sepal.Length", y = "Sepal.Width", group = "Species") %>% 
  bb_axis(x = list(tick = list(fit = FALSE))) %>% 
  bb_point(r = 8) %>% 
  bb_color(palette = brewer.pal(n = 3, name = "Reds"))

# Pie
stars <- data.frame(
  package = c("billboarder", "ggiraph", "officer", "shinyWidgets", "visNetwork"),
  stars = c(9, 177, 43, 44, 169)
)
cols <- brewer.pal(n = 5, name = "Dark2")

billboarder() %>%
  bb_piechart(data = stars) %>%
  bb_color(palette = brewer.pal(n = 5, name = "Reds"))




