library(echogram)


### Name: trim.echogram
### Title: Trim an echogram vertically or horizontally
### Aliases: trim.echogram
### Keywords: manip

### ** Examples

# import 38 kHz data from an HAC file 
hacfile <- system.file("hac", "D20150510-T202500.hac", package = "echogram")
echo2.038 <- read.echogram(hacfile, channel = 1)

# echogram by default
echogram(echo2.038)

# trim the echogram
echo.tmp <- trim.echogram(echo2.038, depth.max = 70, ping.end = 250)
echogram(echo.tmp)



