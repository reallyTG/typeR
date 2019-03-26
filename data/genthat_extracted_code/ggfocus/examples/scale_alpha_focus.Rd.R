library(ggfocus)


### Name: scale_alpha_focus
### Title: scale_color_focus
### Aliases: scale_alpha_focus

### ** Examples

 p <- ggplot(iris,aes(x = Petal.Length, y = Sepal.Length, alpha = Species)) + geom_point() +
  scale_alpha_focus(focus_levels = "versicolor")
 # Note this gives a warning because alpha doesn't always make sense with categorical variables.




