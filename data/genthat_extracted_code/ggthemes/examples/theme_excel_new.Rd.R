library(ggthemes)


### Name: theme_excel_new
### Title: ggplot theme similar to current Excel plot defaults
### Aliases: theme_excel_new

### ** Examples

library("ggplot2")

p <- ggplot(mtcars) +
     geom_point(aes(x = wt, y = mpg, colour = factor(gear))) +
     facet_wrap(~am)
p + theme_excel_new() + scale_colour_excel_new()



