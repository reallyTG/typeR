## ------------------------------------------------------------------------
maxrange <- c(0.01, 10)
library(palr)
pal <- chlPal(palette = TRUE)

sb <- which(pal$breaks >= maxrange[1] & pal$breaks <= maxrange[2])

plot(pal$breaks, col = pal$cols, log = "y", ylim = maxrange)
## select values from the NASA legend
abline(h = c(0.01, 0.03, 0.1, 0.3, 1, 3, 10))

## ------------------------------------------------------------------------
op <- par(fig = c(0.3, 0.7, 0, 1)); 
plot(NA_real_, xlim = c(0, 1), ylim = maxrange, xlab = "", ylab = "", log = "y")
rasterImage(matrix(rev(pal$cols[sb])), 0, 0.01, 1, 10)
abline(h = c(0.01, 0.03, 0.1, 0.3, 1, 3, 10))
par(op)

