library(detect)


### Name: convertEDT
### Title: Conversion between truncated and unlimited effective detection
###   distance (EDR)
### Aliases: convertEDR
### Keywords: misc

### ** Examples

convertEDR(1, 0.5, truncated=FALSE)
## should be close to 1
convertEDR(convertEDR(1, 0.5, truncated=FALSE), 0.5, truncated=TRUE)



