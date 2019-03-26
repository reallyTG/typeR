library(ggTimeSeries)


### Name: stat_horizon
### Title: Plot a time series as a horizon plot
### Aliases: stat_horizon

### ** Examples

{
library(ggplot2)
ggplot(data.frame(x = 1:89, y = as.numeric(unlist(austres))), aes(x =x, y = y, fill = y) )+
   stat_horizon() +
   scale_fill_continuous(low = 'white', high = 'red')

set.seed(10)
ggplot(data.frame(x = 1:1000, y = cumsum(rnorm(1000))), aes(x =x, y = y, fill = y) )+
   stat_horizon() +
   scale_fill_continuous(low = 'white', high = 'red')}



