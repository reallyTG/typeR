library(DescribeDisplay)


### Name: ggplot.ddplot
### Title: Create a nice plot Create a nice looking plot complete with axes
###   using ggplot.
### Aliases: ggplot.ddplot
### Keywords: hplot

### ** Examples

library(ggplot2)
print(ggplot(dd_example("xyplot")))
print(ggplot(dd_example("tour2d")))
print(ggplot(dd_example("tour1d")))
print(ggplot(dd_example("plot1d")))
print(
  ggplot(dd_example("plot1d")) + 
  geom_segment(aes(x = x, xend = x, y = 0, yend = y), size = 0.3)
)



