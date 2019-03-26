library(GGally)


### Name: grab_legend
### Title: Grab the legend and print it as a plot
### Aliases: grab_legend print.legend_guide_box

### ** Examples

library(ggplot2)
histPlot <- qplot(
  x = Sepal.Length,
  data = iris,
  fill = Species,
  geom = "histogram",
  binwidth = 1/4
)
(right <- histPlot)
(bottom <- histPlot + theme(legend.position = "bottom"))
(top <- histPlot + theme(legend.position = "top"))
(left <- histPlot + theme(legend.position = "left"))

grab_legend(right)
grab_legend(bottom)
grab_legend(top)
grab_legend(left)



