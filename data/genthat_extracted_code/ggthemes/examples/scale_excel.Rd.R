library(ggthemes)


### Name: scale_fill_excel
### Title: Excel 97 ugly color scales
### Aliases: scale_fill_excel scale_colour_excel scale_color_excel

### ** Examples

library("ggplot2")

# Line and scatter plot colors
p <- ggplot(mtcars) +
     geom_point(aes(x = wt, y = mpg, colour = factor(gear))) +
     facet_wrap(~am)
p + theme_excel() + scale_colour_excel()

# Bar plot (area/fill) colors
ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar() +
  scale_fill_excel() +
  theme_excel()



