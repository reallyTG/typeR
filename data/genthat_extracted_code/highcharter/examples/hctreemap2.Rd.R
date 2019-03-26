library(highcharter)


### Name: hctreemap2
### Title: Shortcut to create treemaps.
### Aliases: hctreemap2

### ** Examples


## Not run: 
##D 
##D library(tidyverse)
##D library(highcharter)
##D library(RColorBrewer)
##D 
##D data_frame(
##D   index1 = sample(LETTERS[1:5], 500, replace = T),
##D   index2 = sample(LETTERS[6:10], 500, replace = T),
##D   index3 = sample(LETTERS[11:15], 500, replace = T),
##D   value = rpois(500, 5),
##D   color_value = rpois(500, 5)
##D ) %>%
##D   hctreemap2(
##D     group_vars = c("index1", "index2", "index3"),
##D     size_var = "value",
##D     color_var = "color_value",
##D     layoutAlgorithm = "squarified",
##D     levelIsConstant = FALSE,
##D     levels = list(
##D       list(level = 1, dataLabels = list(enabled = TRUE)),
##D       list(level = 2, dataLabels = list(enabled = FALSE)),
##D       list(level = 3, dataLabels = list(enabled = FALSE))
##D     )
##D   ) %>% 
##D   hc_colorAxis(minColor = brewer.pal(7, "Greens")[1],
##D                maxColor = brewer.pal(7, "Greens")[7]) %>% 
##D   hc_tooltip(pointFormat = "<b>{point.name}</b>:<br>
##D              Value: {point.value:,.0f}<br>
##D              Color Value: {point.colorValue:,.0f}")
## End(Not run)




