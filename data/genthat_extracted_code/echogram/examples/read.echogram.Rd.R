library(echogram)


### Name: read.echogram
### Title: Read echogram data from an HAC file
### Aliases: read.echogram
### Keywords: IO

### ** Examples

hacfile <- system.file("hac", "D20150510-T202221.hac", package = "echogram")
echo1 <- read.echogram(hacfile, channel = 1)
class(echo1)
str(echo1)
attr(echo1$Sv, "frequency")
echogram(echo1)



