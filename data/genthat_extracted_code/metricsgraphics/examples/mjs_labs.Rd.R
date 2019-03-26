library(metricsgraphics)


### Name: mjs_labs
### Title: Configure axis labels & plot description
### Aliases: mjs_labs

### ** Examples

mtcars %>%
 mjs_plot(x=wt, y=mpg, width=400, height=300) %>%
 mjs_point(color_accessor=carb, size_accessor=carb) %>%
 mjs_labs(x="Weight of Car", y="Miles per Gallon")




