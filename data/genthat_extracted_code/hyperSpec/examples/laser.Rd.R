library(hyperSpec)


### Name: laser
### Title: Laser Emission A time series of an unstable laser emission.
### Aliases: laser
### Keywords: datasets

### ** Examples


laser

cols <- c ("black", "blue", "darkgreen", "red")
wl <- c (405.0, 405.1, 405.3, 405.4)
plotspc (laser, axis.args=list (x = list (at = seq (404.5, 405.8, .1))))
for (i in seq_along (wl))
   abline (v = wl[i], col = cols[i], lwd = 2, lty = 2)

plotc (laser [,, wl], spc ~ t, groups = .wavelength, type = "b",
       col = cols)

## Not run: vignette ("laser", package="hyperSpec")




