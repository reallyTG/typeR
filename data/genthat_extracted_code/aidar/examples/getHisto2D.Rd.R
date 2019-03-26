library(aidar)


### Name: getHisto2D
### Title: retrieves a given 2D histogram by it's name from the given file
###   and returns it as a data.frame
### Aliases: getHisto2D
### Keywords: aida histogram

### ** Examples

histoFile = system.file("extdata", "histos.xml.gz", package="aidar")
h2 = getHisto2D(histoFile, '10')



