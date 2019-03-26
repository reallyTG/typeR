library(readMzXmlData)


### Name: readMzXmlDir
### Title: Reads recursively mass spectrometry data in mzXML format.
### Aliases: readMzXmlDir
### Keywords: IO

### ** Examples

## load library
library("readMzXmlData")

## get examples directory
exampleDirectory <- system.file("Examples", package="readMzXmlData")

## read example spectra
spec <- readMzXmlDir(exampleDirectory)

## plot spectra
plot(spec[[1]]$spectrum$mass, spec[[1]]$spectrum$intensity, type="n")

l <- length(spec)
legendStr <- character(l)
for (i in seq(along=spec)) {
  lines(spec[[i]]$spectrum$mass, spec[[i]]$spectrum$intensity, type="l",
        col=rainbow(l)[i])
  legendStr[i] <- basename(spec[[i]]$metaData$file)
}

## draw legend
legend(x="topright", legend=legendStr, col=rainbow(l), lwd=1)



