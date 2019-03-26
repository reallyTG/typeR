library(colourpicker)


### Name: plotHelper
### Title: Plot colour helper
### Aliases: plotHelper

### ** Examples

if (interactive()) {
  cols <- plotHelper()
  cols <- plotHelper(colours = c("red", "blue"))
  cols <- plotHelper(colours = 5)

  library(ggplot2)
  cols <- plotHelper(ggplot(mtcars, aes(mpg,wt)) +
                     geom_point(aes(col = as.factor(cyl)))+
                     scale_colour_manual(values = CPCOLS))
}



