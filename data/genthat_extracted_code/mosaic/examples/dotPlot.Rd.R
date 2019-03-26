library(mosaic)


### Name: dotPlot
### Title: Dotplots
### Aliases: dotPlot panel.dotPlot
### Keywords: graphics

### ** Examples

if (require(mosaicData)) {
dotPlot( ~ age, data = HELPrct)
dotPlot( ~ age, nint=42, data = HELPrct)
dotPlot( ~ height | voice.part, data = singer, nint = 17,
          endpoints = c(59.5, 76.5), layout = c(4,2), aspect = 1,
          xlab = "Height (inches)")
}



