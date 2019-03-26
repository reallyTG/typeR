library(echogram)


### Name: join.echogram
### Title: Merge echograms
### Aliases: join.echogram
### Keywords: manip

### ** Examples

# import 38 kHz data from two consecutive HAC files
hacfile1 <- system.file("hac", "D20150510-T202221.hac", package = "echogram")
echo1.038 <- read.echogram(hacfile1, channel = 1)

hacfile2 <- system.file("hac", "D20150510-T202500.hac", package = "echogram")
echo2.038 <- read.echogram(hacfile2, channel = 1)

# join into one echogram
echo.038 <- join.echogram(echo1.038, echo2.038)
str(echo.038)
echogram(echo.038)



