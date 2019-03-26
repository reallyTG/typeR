library(spider)


### Name: localMinima
### Title: Determine thresholds from a density plot
### Aliases: localMinima
### Keywords: Barcoding

### ** Examples



data(anoteropsis)
anoDist <- ape::dist.dna(anoteropsis)

anoThresh <- localMinima(anoDist)
graphics::plot(anoThresh)
anoThresh$localMinima
#Often the first value is the one to go for:
anoThresh$localMinima[1]




