library(chipPCR)


### Name: VIMCFX96_meltcurve
### Title: Melting Curve Measured with the Bio-Rad CFX96
### Aliases: VIMCFX96_meltcurve
### Keywords: datasets melt CFX96

### ** Examples

data(VIMCFX96_meltcurve)
tmp <- VIMCFX96_meltcurve

plot(NA, NA, xlim = c(55,95), ylim = c(2000, 7000), xlab = "Temperature 
    (degrees Celsius)",
    ylab = "RFU", main = "Melting curve in CFX96 (Bio-Rad)")
apply(tmp[, 2:ncol(tmp)], 2, 
      function(x) lines(tmp[1:nrow(tmp),1],x))

Fmean <- rowMeans(tmp[, 2:ncol(tmp)])
lines(tmp[1:nrow(tmp),1], Fmean, col = "red", lwd = 3)

legend(55, 4000, c("Raw", "Mean"), pch = c(19,19), col = c(1,2))



