library(DataExplorer)


### Name: plotDataExplorer
### Title: Default DataExplorer plotting function
### Aliases: plotDataExplorer
### Keywords: internal

### ** Examples

library(ggplot2)
# Update theme of any plot objects
plot_missing(airquality, ggtheme = theme_light())
plot_missing(airquality, ggtheme = theme_minimal(base_size = 20))

# Customized theme components
plot_bar(
  data = diamonds,
  theme_config = list(
  "plot.background" = element_rect(fill = "yellow"),
  "aspect.ratio" = 1
  )
)



