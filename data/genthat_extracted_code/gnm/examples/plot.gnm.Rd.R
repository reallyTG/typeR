library(gnm)


### Name: plot.gnm
### Title: Plot Diagnostics for a gnm Object
### Aliases: plot.gnm
### Keywords: models regression nonlinear hplot

### ** Examples

set.seed(1)

##  Fit an association model with homogeneous row-column effects
RChomog <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
               MultHomog(origin, destination), family = poisson,
               data = occupationalStatus)

## Plot model diagnostics
plot(RChomog)

## Put 4 plots on 1 page; allow room for printing model formula in outer margin:
par(mfrow = c(2, 2), oma = c(0, 0, 3, 0))
title <- paste(deparse(RChomog$formula, width.cutoff = 50), collapse = "\n")
plot(RChomog, sub.caption = title)

## Fit smoother curves
plot(RChomog, sub.caption = title, panel = panel.smooth)
plot(RChomog, sub.caption = title, panel = function(x,y) panel.smooth(x, y, span = 1))




