library(tempR)


### Name: tds.plot
### Title: Plot TDS curves
### Aliases: tds.plot

### ** Examples

# example using 'bars' data set
bars.m <- aggregate(bars[, -c(1:4)], list(samples = bars$sample, attribute = bars$attribute), mean)
bars.m <- bars.m[order(bars.m$sample, bars.m$attribute), ]
attributes <- unique(bars$attribute)
times <- get.times(colnames(bars.m)[-c(1:2)])
chance <- get.chance(attributes)
signif <- get.significance(chance, nrow(unique(bars[, 1:2])))
tds.plot(get.smooth(bars.m[bars.m$sample == 1, -c(1:2)]), attributes = attributes,
         times = times, chance = chance, signif = signif,
         lwd = 2, main = "Bar 1")

# it is possible to hide the portion of the plot below the significance line:
rect(-2, -0.2, times[length(times)]+2, signif, col = "white", border = "transparent")
# re-add axes & significance line
axis(1, labels = seq(0, 45, by = 5), at = seq(0, 45, by = 5))
axis(2)
abline(h=signif, lty=3, col = "grey")



