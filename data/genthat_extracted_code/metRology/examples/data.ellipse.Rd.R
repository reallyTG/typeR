library(metRology)


### Name: data.ellipse
### Title: Construct data ellipses suitable for use with Youden plots.
### Aliases: data.ellipse summary.d.ellipse d.ellipse print.d.ellipse
### Keywords: dplot hplot

### ** Examples

data(chromium)
cov.Cr <- cov.dellipse(chromium)
dellipse.Cr <- data.ellipse(cov.Cr, plot=FALSE)
summary(dellipse.Cr)



