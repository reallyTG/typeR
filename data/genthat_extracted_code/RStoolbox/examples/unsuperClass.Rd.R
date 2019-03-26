library(RStoolbox)


### Name: unsuperClass
### Title: Unsupervised Classification
### Aliases: unsuperClass

### ** Examples

library(raster)
input <- brick(system.file("external/rlogo.grd", package="raster"))

## Plot 
olpar <- par(no.readonly = TRUE) # back-up par
par(mfrow=c(1,2))
plotRGB(input)

## Run classification
set.seed(25)
unC <- unsuperClass(input, nSamples = 100, nClasses = 5, nStarts = 5)
unC

## Plots
colors <- rainbow(5)
plot(unC$map, col = colors, legend = FALSE, axes = FALSE, box = FALSE)
legend(1,1, legend = paste0("C",1:5), fill = colors,
       title = "Classes", horiz = TRUE,  bty = "n")

par(olpar) # reset par



