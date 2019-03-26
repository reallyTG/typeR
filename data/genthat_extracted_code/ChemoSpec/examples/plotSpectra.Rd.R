library(ChemoSpec)


### Name: plotSpectra
### Title: Plot Spectra Object
### Aliases: plotSpectra
### Keywords: hplot

### ** Examples


data(metMUD1)
plotSpectra(metMUD1, main = "metMUD1 NMR Data",
	 which = c(10, 11), yrange = c(0,1.5),
	 offset = 0.06, amplify = 10, lab.pos = 0.5)

# Add a legend at x, y coords
plotSpectra(metMUD1, main = "metMUD1 NMR Data",
	 which = c(10, 11), yrange = c(0,1.5),
	 offset = 0.06, amplify = 10, lab.pos = 0.5,
  leg.loc = list(x = 3.2, y = 1.45))




