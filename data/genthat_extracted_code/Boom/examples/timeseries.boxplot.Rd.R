library(Boom)


### Name: TimeSeriesBoxplot
### Title: Time Series Boxplots
### Aliases: TimeSeriesBoxplot
### Keywords: hplot

### ** Examples

  x <- t(matrix(rnorm(1000 * 100, 1:100, 1:100), nrow=100))
  ## x has 1000 rows, and 100 columns.  Column i is N(i, i^2) noise.
  time <- as.Date("2010-01-01", format = "%Y-%m-%d") + (0:99 - 50)*7
  TimeSeriesBoxplot(x, time)



