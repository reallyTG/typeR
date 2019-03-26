library(RStoolbox)


### Name: estimateHaze
### Title: Estimate Image Haze for Dark Object Subtraction (DOS)
### Aliases: estimateHaze

### ** Examples

data(lsat)

## Estimate haze for blue, green and red band
haze <- estimateHaze(lsat, hazeBands = 1:3, plot = TRUE)
haze

## Find threshold interactively
#### Return the frequency tables for re-use 
#### avoids having to sample the Raster again and again
haze <- estimateHaze(lsat, hazeBands = 1:3, returnTables = TRUE)
## Use frequency table instead of lsat and fiddle with 
haze <- estimateHaze(haze, hazeBands = 1:3, darkProp = .1, plot = TRUE)
haze$SHV



