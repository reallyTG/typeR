library(echogram)


### Name: match.echogram
### Title: Match ping times from two echograms
### Aliases: match.echogram
### Keywords: manip

### ** Examples


# import 38 and 120 kHz data from an HAC file 
hacfile <- system.file("hac", "D20150510-T202221.hac", package = "echogram")
echo1.038 <- read.echogram(hacfile, channel = 1)
echo1.120 <- read.echogram(hacfile, channel = 2)

# Sv matrices have different number of pings
dim(echo1.038$Sv); dim(echo1.120$Sv)

# Apply match ping times
tmp <- match.echogram(echo1.038, echo1.120)

# split the list in the two echograms 
echo1.038 <- tmp$echogram1
echo1.120 <- tmp$echogram2

# number of pings and ping times are now the same for both frequencies
dim(echo1.038$Sv); dim(echo1.120$Sv)



