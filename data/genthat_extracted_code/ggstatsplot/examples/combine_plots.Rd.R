library(ggstatsplot)


### Name: combine_plots
### Title: Combining and arranging multiple plots in a grid
### Aliases: combine_plots

### ** Examples

# loading the necessary libraries
library(ggplot2)

# preparing the first plot
p1 <-
  ggplot2::ggplot(
    data = subset(iris, iris$Species == "setosa"),
    aes(x = Sepal.Length, y = Sepal.Width)
  ) +
  geom_point() +
  labs(title = "setosa")

# preparing the second plot
p2 <-
  ggplot2::ggplot(
    data = subset(iris, iris$Species == "versicolor"),
    aes(x = Sepal.Length, y = Sepal.Width)
  ) +
  geom_point() +
  labs(title = "versicolor")

# combining the plot with a title and a caption
combine_plots(
  p1,
  p2,
  labels = c("(a)", "(b)"),
  title.text = "Dataset: Iris Flower dataset",
  caption.text = "Note: Only two species of flower are displayed",
  title.color = "red",
  caption.color = "blue"
)



