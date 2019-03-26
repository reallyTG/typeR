library(aidar)


### Name: getHisto3D
### Title: retrieves a given 3D histogram by it's name from the given file
###   and returns it as a data.frame
### Aliases: getHisto3D
### Keywords: aida histogram

### ** Examples

histoFile = system.file("extdata", "histos.xml.gz", package="aidar")
h3 = getHisto3D(histoFile, '13')



