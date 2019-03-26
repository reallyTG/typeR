library(adegraphics)


### Name: s.distri
### Title: 2-D scatter plot with means/standard deviations computed using
###   an external table of weights
### Aliases: s.distri
### Keywords: aplot hplot

### ** Examples

data(rpjdl, package = "ade4")
xy <- ade4::dudi.coa(rpjdl$fau, scan = FALSE)$li
j <- c(1, 5, 8, 20, 21, 23, 26, 33, 36, 44, 47, 49)
dfdistri <- rpjdl$fau[, j]
coli <- colorRampPalette(c("blue", "red", "orange"))(49)[j]

s.distri(xy, dfdistri, ellipseSize = 1, starSize = 0, porigin.include = FALSE, 
  pellipses = list(col = coli, alpha = 0.3), plabels.cex = 0)



