library(mosaic)


### Name: freqpoly
### Title: Turn histograms into frequency polygons
### Aliases: freqpoly hist2freqpolygon plot.freqpolygon

### ** Examples

freqpoly(faithful$eruptions)
bks <- c(0, 1, 1.5, 2, 3, 3.5, 4, 4.5, 5, 7)
hist(faithful$eruptions, breaks = bks)
freqpoly(faithful$eruptions, col = rgb(0,0,1,.5), lwd = 5, breaks = bks, add = TRUE)




