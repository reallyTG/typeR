library(aidar)


### Name: getCloud2D
### Title: retrieves a given 2D cloud by it's name from the given file and
###   returns it as a data.frame
### Aliases: getCloud2D
### Keywords: aida cloud

### ** Examples

histoFile = system.file("extdata", "clouds.xml.gz", package="aidar")
c2d = getCloud2D(histoFile, '30')



