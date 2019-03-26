library(billboarder)


### Name: bb_colors_manual
### Title: Set colors for each datas
### Aliases: bb_colors_manual

### ** Examples


library("RColorBrewer")

# Scatter
billboarder() %>% 
  bb_scatterplot(
   data = iris, 
   x = "Sepal.Length", 
   y = "Sepal.Width", 
   group = "Species"
  ) %>% 
  bb_axis(x = list(tick = list(fit = FALSE))) %>% 
  bb_point(r = 8) %>% 
  bb_colors_manual(
   setosa = "#440154", 
   virginica = "#21908C", 
   versicolor = "#FDE725"
  )

# Pie
stars <- data.frame(
  package = c("billboarder", "ggiraph", "officer",
              "shinyWidgets", "visNetwork"),
  stars = c(9, 177, 43, 44, 169)
)
cols <- brewer.pal(n = 5, name = "Dark2")

billboarder() %>% 
  bb_piechart(data = stars) %>% 
  bb_colors_manual(
   setNames(as.list(cols), stars$package) # this is a named list
  )
  



