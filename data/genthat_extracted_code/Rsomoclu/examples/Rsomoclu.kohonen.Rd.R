library(Rsomoclu)


### Name: Rsomoclu.kohonen
### Title: convert Somoclu train result to kohonen class for plotting
### Aliases: Rsomoclu.kohonen

### ** Examples

library('Rsomoclu')
library('kohonen')
data("rgbs", package = "Rsomoclu")
input_data <- rgbs
input_data <- data.matrix(input_data)
nSomX <- 20
nSomY <- 20
nEpoch <- 10
radius0 <- 0
radiusN <- 0
radiusCooling <- "linear"
scale0 <- 0
scaleN <- 0.01
scaleCooling <- "linear"
kernelType <- 0
mapType <- "planar"
gridType <- "rectangular"
compactSupport <- FALSE
codebook <- NULL
neighborhood <- "gaussian"
stdCoeff <- 0.5
res <- Rsomoclu.train(input_data, nEpoch, nSomX, nSomY,
                      radius0, radiusN,
                      radiusCooling, scale0, scaleN,
                      scaleCooling,
                      kernelType, mapType, gridType, compactSupport, 
                      neighborhood, stdCoeff, codebook)
## Convert to kohonen object for plotting
sommap = Rsomoclu.kohonen(input_data, res)
## Show 'codebook'
plot(sommap, type="codes", main = "Codes")
## Show 'component planes'
plot(sommap, type = "property", property = sommap$codes[[1]][,1],
     main = colnames(sommap$codes)[1])
## Show 'U-Matrix'
plot(sommap, type="dist.neighbours")



