library(hyperSpec)


### Name: plotc
### Title: Calibration- and Timeseries Plots, Depth-Profiles and the like
###   'plotc' plots intensities of a 'hyperSpec' object over another
###   dimension such as concentration, time, or a spatial coordinate.
### Aliases: plotc
### Keywords: hplot

### ** Examples



## example 1: calibration of fluorescence 
plotc (flu) ## gives a warning

plotc (flu, func = mean)
plotc (flu, func = range, groups = .wavelength)

plotc (flu[,,450], ylab = expression (I ["450 nm"] / a.u.))


calibration <- lm (spc ~ c, data = flu[,,450]$.)
summary (calibration)
plotc (flu [,, 450], type = c("p", "r"))

conc <- list (c = seq (from = 0.04, to = 0.31, by = 0.01))
ci <- predict (calibration, newdata = conc, interval = "confidence", level = 0.999) 

panel.ci <-  function (x, y, ...,
                       conc, ci.lwr, ci.upr, ci.col = "#606060") {
   panel.xyplot (x, y, ...)
   panel.lmline (x, y,...)
   panel.lines (conc, ci.lwr, col = ci.col)
   panel.lines (conc, ci.upr, col = ci.col)
}

plotc (flu [,, 450], panel = panel.ci,
       conc = conc$c, ci.lwr = ci [, 2], ci.upr = ci [, 3])

## example 2: time-trace of laser emission modes
cols <- c ("black", "blue", "#008000", "red")
wl <- i2wl (laser, c(13, 17, 21, 23))

plotspc (laser, axis.args=list (x = list (at = seq (404.5, 405.8, .1))))
for (i in seq_along (wl))
   abline (v = wl[i], col = cols[i], lwd = 2)

plotc (laser [,, wl], spc ~ t, groups = .wavelength, type = "b",
       col = cols)




