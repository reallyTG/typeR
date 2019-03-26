library(hyperSpec)


### Name: plotmat
### Title: Plot spectra matrix
### Aliases: plotmat

### ** Examples

plotmat (laser, col = alois.palette (100))

plot (laser, "mat")

plotmat (laser)
plotmat (laser, contour = TRUE, add = TRUE)

## use different y axis labels

plotmat (laser, "t")

plotmat (laser, laser$t / 3600, ylab = "t / h")



