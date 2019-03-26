library(aidar)


### Name: getCloud1D
### Title: retrieves a given 1D cloud by it's name from the given file and
###   returns it as a data.frame
### Aliases: getCloud1D
### Keywords: aida cloud

### ** Examples

histoFile = system.file("extdata", "clouds.xml.gz", package="aidar")
c1d = getCloud1D(histoFile, '21')



