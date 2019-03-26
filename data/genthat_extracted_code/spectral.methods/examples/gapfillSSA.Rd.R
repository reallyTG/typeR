library(spectral.methods)


### Name: gapfillSSA
### Title: Fill gaps in a vector (time-series) with SSA
### Aliases: gapfillSSA
### Keywords: SSA, gap filling, time series, spectral analysis, singular
###   spectrum analysis

### ** Examples

## create series with gaps
series.ex <- sin(2 * pi * 1:1000 / 100) +  0.7 * sin(2 * pi * 1:1000 / 10) +
  rnorm(n = 1000, sd = 0.4)
series.ex[sample(c(1:1000), 30)] <- NA
series.ex[c(seq(from = sample(c(1:1000), 1), length.out = 20),
            seq(from = sample(c(1:1000), 1), length.out = 20))]<-NA
indices.gaps <- is.na(series.ex)

## prepare graphics
layout(matrix(c(1:5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7), ncol = 5, byrow = TRUE), 
       widths = c(1, 1, 1, 0.1, 0.1))
par(mar = c(2, 0, 0, 0.2), oma = c(0, 3, 2, 0.2), tcl = 0.2, mgp = c(0, 0, 100),
    las = 1)

## perform gap filling
data.filled <- gapfillSSA(series = series.ex, plot.results = TRUE, open.plot = FALSE)

## plot series and filled series
plot(series.ex, xlab = '', pch = 16)
plot(data.filled$filled.series, col = indices.gaps+1, xlab = '', pch = 16)
points(data.filled$reconstr, type = 'l', col = 'blue')
mtext(side = 1, 'Index', line = 2)
legend(x = 'topright', merge = TRUE, pch = c(16, 16, NA), lty = c(NA, NA, 1), 
       col = c('black', 'red', 'blue'),
       legend = c('original values', 'gap filled values', 'reconstruction'))



