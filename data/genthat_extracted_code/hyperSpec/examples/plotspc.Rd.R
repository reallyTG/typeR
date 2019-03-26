library(hyperSpec)


### Name: plotspc
### Title: Plotting Spectra Plot the spectra of a 'hyperSpec' object, i.e.
###   intensity over wavelength. Instead of the intensity values of the
###   spectra matrix summary values calculated from these may be used.
### Aliases: plotspc stacked.offsets
### Keywords: hplot

### ** Examples


plotspc (flu)

## artificial example to show wavelength axis cutting
plotspc (chondro [sample (nrow (chondro), 50)],
         wl.range = list (600 ~ 650, 1000 ~ 1100, 1600 ~ 1700),
         xoffset = c (0, 300, 450))

plotspc (chondro [sample (nrow (chondro), 50)],
         wl.range = list (600 ~ 650, 1000 ~ 1100, 1600 ~ 1700),
         xoffset = c (300, 450))

## some journals publish Raman spectra backwards
plotspc (chondro [sample (nrow (chondro), 50)], wl.reverse = TRUE)

plotspc (laser[(0:4)*20+1,,], stacked = TRUE)

plotspc (laser, func = mean_pm_sd,
         col = c(NA, "red", "black"), lines.args = list (lwd = 2),
         fill = c (1, NA, 1),
         fill.col = "yellow", border = "blue",
         polygon.args = list (lty = 2, lwd = 4),
         title.args = list (xlab = expression (lambda[emission] / nm),
                            y = list(line = 3.4),
                            col.lab = "darkgreen"),
         axis.args = list (x = list (col = "magenta"), y = list (las = 1))
        )

mean.pm.sd <- aggregate (chondro, chondro$clusters, mean_pm_sd)
plot (mean.pm.sd, col = matlab.palette (3), fill = ".aggregate", stacked = ".aggregate")


mean.pm.sd <- aggregate (chondro, chondro$clusters, mean_pm_sd)

offset <- stacked.offsets (mean.pm.sd, ".aggregate")
plot (mean.pm.sd, fill.col = matlab.palette (3), fill = ".aggregate",
      stacked = ".aggregate")

plot (aggregate (chondro, chondro$clusters, mean), yoffset = offset$offsets,
      lines.args = list (lty = 2, lwd = 2), add = TRUE)

barb <- do.call (collapse, barbiturates [1:3])
plot (barb, lines.args = list (type = "h"), stacked = TRUE,
      stacked.args = list (add.factor = .2))





