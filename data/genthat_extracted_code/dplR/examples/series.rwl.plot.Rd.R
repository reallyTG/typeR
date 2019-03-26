library(dplR)


### Name: series.rwl.plot
### Title: Plot Series and a Master
### Aliases: series.rwl.plot
### Keywords: manip

### ** Examples
library(utils)
data(co021)
foo <- series.rwl.plot(rwl = co021, series = "646244", seg.length = 100,
                       n = 5)
## note effect of n on first year in the series
foo <- series.rwl.plot(rwl = co021, series = "646244", seg.length = 100,
                       n = 13, prewhiten = FALSE)
bar <- series.rwl.plot(rwl = co021, series = "646244", seg.length = 100,
                       n = 7, prewhiten = FALSE)
head(foo$series)
head(bar$series)



