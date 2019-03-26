library(ggthemes)


### Name: scale_colour_excel_new
### Title: Excel (current versions) color scales
### Aliases: scale_colour_excel_new scale_color_excel_new
###   scale_fill_excel_new

### ** Examples

library("ggplot2")

p <- ggplot(mtcars) +
     geom_point(aes(x = wt, y = mpg, colour = factor(gear))) +
     facet_wrap(~am)
p + theme_excel_new() + scale_colour_excel_new()



