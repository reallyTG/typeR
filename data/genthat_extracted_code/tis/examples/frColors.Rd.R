library(tis)


### Name: frColors
### Title: FRB Color Palettes
### Aliases: frColors
### Keywords: color device

### ** Examples

plot.new()
for(i in 1:11) abline(h = (i-0.5)/11, lwd = 2, lty = 1, col = frColors()[i])
plot.new()
for(i in 1:11) abline(h = (i-0.5)/11, lwd = 2, lty = 1, col = frColors(dark = TRUE)[i])



