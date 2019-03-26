library(metRology)


### Name: plot.d.ellipse
### Title: Plot data ellipses
### Aliases: plot.d.ellipse
### Keywords: dplot

### ** Examples


data(chromium)
cov.Cr <- cov.dellipse(chromium)
dellipse.Cr <- data.ellipse(cov.Cr, plot=FALSE)
plot(dellipse.Cr)




