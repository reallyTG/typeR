library(autoplotly)


### Name: autoplotly
### Title: Automatic Visualization of Popular Statistical Results Using
###   'plotly.js' and 'ggplot2'
### Aliases: autoplotly autoplotly autoplotly-package

### ** Examples

# Automatically generate interactive plot for results produced by `stats::prcomp`
p <- autoplotly(prcomp(iris[c(1, 2, 3, 4)]), data = iris,
                colour = 'Species', label = TRUE, label.size = 3, frame = TRUE)

# You can apply additional ggplot2 elements to interactive plot built using `autoplotly()`
p +
  ggplot2::ggtitle("Principal Components Analysis") +
  ggplot2::labs(y = "Second Principal Components", x = "First Principal Components")

# Or apply additional plotly elements to the generated interactive plot
p %>% plotly::layout(annotations = list(
  text = "Example Text",
  font = list(
    family = "Courier New, monospace",
    size = 18,
    color = "black"),
  x = 0,
  y = 0,
  showarrow = TRUE))



