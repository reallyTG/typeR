library(ggTimeSeries)


### Name: ggplot_waterfall
### Title: Plots a water fall plot
### Aliases: ggplot_waterfall

### ** Examples

{
library(ggplot2)
set.seed(1)
dfData = data.frame(x = 1:100, y = cumsum(rnorm(100)))
ggplot_waterfall(
   dtData = dfData,
   'x',
   'y'
)}



