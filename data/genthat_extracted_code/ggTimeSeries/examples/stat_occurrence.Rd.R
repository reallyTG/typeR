library(ggTimeSeries)


### Name: stat_occurrence
### Title: Plots a time series as a dot plot
### Aliases: stat_occurrence

### ** Examples

{
library(data.table)
library(ggplot2)
set.seed(1)
dfData = data.table(x = 1:100, y = floor(4 * abs(rnorm(100, 0 , 0.4))))
ggplot(dfData, aes(x =x, y = y) )+
   stat_occurrence()+
   coord_fixed()}



