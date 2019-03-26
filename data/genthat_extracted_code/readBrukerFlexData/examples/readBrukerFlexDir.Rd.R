library(readBrukerFlexData)


### Name: readBrukerFlexDir
### Title: Reads recursively mass spectrometry data in Bruker Daltonics
###   XMASS format.
### Aliases: readBrukerFlexDir
### Keywords: IO

### ** Examples

## load library
library("readBrukerFlexData")

## get examples directory
exampleDirectory <- system.file("Examples", package="readBrukerFlexData")

## read example spectra
spec <- readBrukerFlexDir(file.path(exampleDirectory,
  "2010_05_19_Gibb_C8_A1"))

## plot spectra
plot(spec[[1]]$spectrum$mass, spec[[1]]$spectrum$intensity, type="n")

l <- length(spec)
legendStr <- character(l)
for (i in seq(along=spec)) {
  lines(spec[[i]]$spectrum$mass, spec[[i]]$spectrum$intensity, type="l",
        col=rainbow(l)[i])
  legendStr[i] <- spec[[i]]$metaData$fullName
}

## draw legend
legend(x="topright", legend=legendStr, col=rainbow(l), lwd=1)




