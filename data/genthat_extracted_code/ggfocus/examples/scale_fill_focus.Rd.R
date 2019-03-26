library(ggfocus)


### Name: scale_fill_focus
### Title: scale_fill_focus
### Aliases: scale_fill_focus

### ** Examples

 p <- ggplot(iris,aes(x = Petal.Length, group = Species, fill = Species)) + geom_histogram() +
  scale_fill_focus(focus_levels = "versicolor", color_focus = "red")




