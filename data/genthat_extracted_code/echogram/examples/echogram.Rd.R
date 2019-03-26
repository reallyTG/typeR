library(echogram)


### Name: echogram
### Title: Echogram visualisation
### Aliases: echogram
### Keywords: hplot

### ** Examples

# import hac file
hacfile <- system.file("hac", "D20150510-T202500.hac", package = "echogram")
echo2.038 <- read.echogram(hacfile)

# echogram by default 
echogram(echo2.038)

# using alternative color schemes
echogram(echo2.038, Svthr = -70, col.sep = 1.5, scheme = "EK500")
echogram(echo2.038, Svthr = -70, col.sep = 3, scheme = c("white", "blue", "grey", "black"))



