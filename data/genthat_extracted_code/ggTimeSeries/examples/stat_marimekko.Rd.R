library(ggTimeSeries)


### Name: stat_marimekko
### Title: Plot two categorical variables as marimekko
### Aliases: stat_marimekko

### ** Examples

{
library(ggplot2)
ggplot(
   data.frame(
      x1 = round(3 * runif(10000), 0),
      y1 = pmax(pmin(round(3 * rnorm(10000), 0), 3), -3),
      weight = 1:10000
   )
) +
   stat_marimekko(
      aes(
         xbucket = x1,
         ybucket = y1,
         fill = factor(y1),
         weight = weight
      ),
      xlabelyposition = 1.1,
      color = 'black'
   )}



