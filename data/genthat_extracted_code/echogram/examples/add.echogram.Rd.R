library(echogram)


### Name: add.echogram
### Title: Add two echograms
### Aliases: add.echogram
### Keywords: array

### ** Examples

# import 38 and 120 kHz data from an HAC file 
hacfile <- system.file("hac", "D20150510-T202500.hac", package = "echogram")
echo2.038 <- read.echogram(hacfile, channel = 1)
echo2.120 <- read.echogram(hacfile, channel = 2)

## Not run: 
##D # attempting to add the two frequencies with unequal number of pings gives an error
##D add.echogram(echo2.038, echo2.120, "plus", "dB")
## End(Not run)

# running match.echogram() solves this
tmp <- match.echogram(echo2.038, echo2.120)
str(tmp) # both frequencies are in a list, need to split
echo2.038 <- tmp$echogram1
echo2.120 <- tmp$echogram2

# we don't want to add bottom echoes, mask bottom and surface from both frequencies
echo2.038m <- mask.echogram(echo2.038, surf.off = 2, bott.off = 0.2)
echo2.120m <- mask.echogram(echo2.120, surf.off = 2, bott.off = 0.2)

# adding Sv values and plot result
echo.sum <- add.echogram(echo2.038m, echo2.120m, "plus", "dB")
Min <- min(as.vector(echo.sum$Sv), na.rm=TRUE) # useful to set Sv threshold
echogram(echo.sum, Svthr=floor(Min), scheme = "EK500")

# subtract 38 from 120 kHz
echo.minus <- add.echogram(echo2.120m, echo2.038m, "minus", "dB")
Min <- min(as.vector(echo.minus$Sv), na.rm=TRUE)
echogram(echo.minus, Svthr=floor(Min), scheme = "EK500")



