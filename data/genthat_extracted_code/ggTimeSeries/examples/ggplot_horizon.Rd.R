library(ggTimeSeries)


### Name: ggplot_horizon
### Title: Plot a time series as a horizon plot
### Aliases: ggplot_horizon

### ** Examples

{
library(ggplot2)
set.seed(1)
dfData = data.frame(x = 1:1000, y = cumsum(rnorm(1000)))
p1 = ggplot_horizon(dfData, 'x', 'y')
p1
# add new geoms or colours
p1 +
geom_text(label = '!!!') +
scale_colour_continuous(low = 'red', high = 'green')
}



