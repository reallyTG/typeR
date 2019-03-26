library(esquisse)


### Name: ggplot_to_ppt
### Title: Utility to export ggplot objects to PowerPoint
### Aliases: ggplot_to_ppt

### ** Examples


# Shiny gadget
if (interactive()) {

ggplot_to_ppt()



# Or with an object's name
library(ggplot2)
p <- ggplot(iris) +
  geom_point(aes(Sepal.Length, Sepal.Width))

ggplot_to_ppt("p")

}




