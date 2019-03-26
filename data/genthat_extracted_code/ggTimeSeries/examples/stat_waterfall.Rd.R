library(ggTimeSeries)


### Name: stat_waterfall
### Title: Plot a time series as a waterfall plot
### Aliases: stat_waterfall

### ** Examples

{
library(ggplot2)
set.seed(1)
dfData = data.frame(x = 1:20, y = cumsum(rnorm(20)))
ggplot(dfData, aes(x =x, y = y) )+
   stat_waterfall()}



