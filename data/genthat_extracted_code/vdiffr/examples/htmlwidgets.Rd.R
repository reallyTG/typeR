library(vdiffr)


### Name: htmlwidgets
### Title: HTML Widgets for graphical comparison
### Aliases: htmlwidgets widget_toggle_ widget_slide_ widget_diff_
###   widget_toggle widget_slide widget_diff

### ** Examples

p1 <- function() hist(mtcars$disp)
p2 <- function() hist(mtcars$drat)

# You can also call these functions in a R Markdown document or
# in a Shiny application:
widget_toggle(p1, p2)
widget_slide(p1, p2)
widget_diff(p1, p2)



