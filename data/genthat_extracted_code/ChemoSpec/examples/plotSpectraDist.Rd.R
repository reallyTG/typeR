library(ChemoSpec)


### Name: plotSpectraDist
### Title: Plot the Distance Between Spectra in a Spectra Object
### Aliases: plotSpectraDist
### Keywords: hplot multivariate

### ** Examples


data(SrE.NMR)
txt1 <- paste("Distance from", SrE.NMR$names[1]) # capture before padding
txt2 <- paste("Rank Distance from", SrE.NMR$names[1])
SrE.NMR$names <- paste("  ", SrE.NMR$names, sep = "") # pad the names for better appearance
temp <- plotSpectraDist(SrE.NMR, xlab = txt2, ylab = txt1, main = txt1,
  xlim = c(1,16), ylim = c(0, 0.3), srt = 90)




