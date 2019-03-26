library(adegraphics)


### Name: adeg.panel.hist
### Title: Panel function for adding histograms.
### Aliases: adeg.panel.hist
### Keywords: aplot

### ** Examples

if(require(KernSmooth, quietly = TRUE) & require(lattice, quietly = TRUE)) {

  z <- round(rnorm(100, 30, 5))
  h <- hist(z, plot = FALSE)
  d <- bkde(z, kernel = "normal", gridsize = 60)
  l <- c(10, 20, 30, 40)
  xyplot(1:50 ~ 1:50, histValues = h, densi = d, drawLines = l, 
    panel = function(drawLines, histValues, densi){
      adeg.panel.hist(histValues = histValues, drawLines = drawLines, densi = densi)})
}



