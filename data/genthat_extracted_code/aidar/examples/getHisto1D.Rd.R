library(aidar)


### Name: getHisto1D
### Title: retrieves a given 1D histogram by it's name from the given file
###   and returns it as a data.frame
### Aliases: getHisto1D
### Keywords: aida histogram

### ** Examples

histoFile = system.file("extdata", "histos.xml.gz", package="aidar")
h1 = getHisto1D(histoFile, '1')



