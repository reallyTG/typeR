library(Rlibeemd)


### Name: extrema
### Title: Local Extrema of Time Series
### Aliases: extrema

### ** Examples

ext <- extrema(UKgas)
plot(UKgas, ylim = range(ext$maxima[, 2], ext$minima[, 2]))
points(ext$maxima, col = 2, pch = 19)
points(ext$minima, col = 2, pch = 19)

# Artificial extremas obtained by extrapolating last two extrema
# Beginning of the series
lines(ext$minima[1:3, ], col = 4) 
# This is discarded as it produces smaller extrema than the last observation:
b <- lm(c(ext$maxima[2:3, 2]) ~ ext$maxima[2:3, 1])$coef[2]
points(x = ext$maxima[1, 1], y = ext$maxima[2, 2] - b, col = 4,pch = 19) 
lines(x = ext$maxima[1:3, 1], y = c(ext$maxima[2, 2] - b, ext$maxima[2:3, 2]), col = 4)
# End of the series
# These produce more extreme values than the last observation which is thus disregarded
lines(ext$minima[27:29, ],col = 4) 
lines(ext$maxima[26:28, ],col = 4) 




