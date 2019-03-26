library(zoo)


### Name: rollmean
### Title: Rolling Means/Maximums/Medians/Sums
### Aliases: rollmean rollmax rollmedian rollsum rollmeanr rollmaxr
###   rollmedianr rollsumr rollmean.zoo rollmax.zoo rollmedian.zoo
###   rollsum.zoo rollmean.ts rollmax.ts rollmedian.ts rollsum.ts
###   rollmean.default rollmax.default rollmedian.default rollsum.default
### Keywords: ts

### ** Examples

x.Date <- as.Date(paste(2004, rep(1:4, 4:1), sample(1:28, 10), sep = "-"))
x <- zoo(rnorm(12), x.Date)

## rolling operations for univariate series
rollmean(x, 3)
rollmax(x, 3)
rollmedian(x, 3)
rollsum(x, 3)

## rolling operations for multivariate series
xm <- zoo(matrix(1:12, 4, 3), x.Date[1:4])
rollmean(xm, 3)
rollmax(xm, 3)
rollmedian(xm, 3)
rollsum(xm, 3)

## rollapply vs. dedicated rollmean
rollapply(xm, 3, mean) # uses rollmean
rollapply(xm, 3, function(x) mean(x)) # does not use rollmean



