library(spectral.methods)


### Name: filterTSeriesSSA
### Title: Decompose a vector (i.e. time series) into spectral bands
### Aliases: filterTSeriesSSA
### Keywords: SSA, time series, spectral analysis, singular spectrum
###   analysis, spectral decomposition, filter

### ** Examples

#create series consisting of two oscillations and noise
series.ex <- sin(2 * pi * 1:1000 / 100) +  0.7 * sin(2 * pi * 1:1000 / 10)  +
  rnorm(n = 1000, sd = 0.4)

#prepare graphics
layout(matrix(c(1, 2, 3, 4, 5, 6, 7, 8), ncol = 2))
par(tcl = 0.2, mgp = c(2, 0, 0), mar = c(0, 4, 0, 0), oma = c(2, 0, 2, 0),
    ps = 10, cex = 1)
plot.new()

#perform decomposition
data.decomposed <- filterTSeriesSSA(series = series.ex,
    borders.wl = list(a = c(8, 12), b = c(80, 120)
        , c = c(0, 10, 100, Inf)),
    M = c(30, 200, 100),
    n.comp = c(10, 20, 20),
    harmonics = c(1, 0, 0),
    plot.spectra = TRUE, open.plot = FALSE)

#plot series and spectral parts
plot(series.ex)
plot(data.decomposed$dec.series[1, ], ylab = '')
plot(data.decomposed$dec.series[2, ], ylab = '')
plot(colSums(data.decomposed$dec.series[-c(1:2), ]), ylab = '')
mtext(side = 2, outer = TRUE, at = -(1 / 8) + ((4:1) * (1 / 4)),
    c('orig.series', '1.step', '2.step', '3.step'), las = 3, cex = 1.5, line = -1)
mtext(side = 3, outer = TRUE, at = -(1 / 4) + ((1:2) * (1 / 2)),
    c('pseudospectra', 'identified components'), las = 1, cex = 1.5, line = 1)




