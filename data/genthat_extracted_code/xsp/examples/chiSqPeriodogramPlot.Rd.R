library(xsp)


### Name: chiSqPeriodogramPlot
### Title: Draw a graph of chi-square periodogram
### Aliases: chiSqPeriodogramPlot

### ** Examples

oscillation <- sin(seq(0, 2 * pi * 10, by = 2 * pi / 1440))
oscillation.df <- data.frame(dateTime = 1:length(oscillation), value = oscillation)
chiSqPeriodogramPlot(chiSqPeriodogram(oscillation.df))




