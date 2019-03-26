library(spatstat)


### Name: Smooth.ppp
### Title: Spatial smoothing of observations at irregular points
### Aliases: Smooth.ppp markmean markvar
### Keywords: spatial methods smooth

### ** Examples

   # Longleaf data - tree locations, marked by tree diameter
   # Local smoothing of tree diameter (automatic bandwidth selection)
   Z <- Smooth(longleaf)
   # Kernel bandwidth sigma=5
   plot(Smooth(longleaf, 5))
   # mark variance
   plot(markvar(longleaf, sigma=5))
   # data frame of marks: trees marked by diameter and height
   plot(Smooth(finpines, sigma=2))
   head(Smooth(finpines, sigma=2, at="points"))



