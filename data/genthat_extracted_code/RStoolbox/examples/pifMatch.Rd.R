library(RStoolbox)


### Name: pifMatch
### Title: Pseudo-Invariant Features based Image Matching
### Aliases: pifMatch

### ** Examples

library(raster)

## Import Landsat example data
data(lsat)

## Create fake example data
## In practice this would be an image from another acquisition date
lsat_b <- log(lsat)  

## Run pifMatch and return similarity layer, invariant features mask and models
lsat_b_adj <- pifMatch(lsat_b, lsat, returnPifMap = TRUE, 
                         returnSimMap = TRUE, returnModels = TRUE)

## Pixelwise similarity
ggR(lsat_b_adj$simMap, geom_raster = TRUE)

## Pesudo invariant feature mask 
ggR(lsat_b_adj$pifMap)

## Histograms of changes
par(mfrow=c(1,3))
hist(lsat_b[[1]], main = "lsat_b")
hist(lsat[[1]], main = "reference")
hist(lsat_b_adj$img[[1]], main = "lsat_b adjusted")

## Model summary for first band
summary(lsat_b_adj$models[[1]])



