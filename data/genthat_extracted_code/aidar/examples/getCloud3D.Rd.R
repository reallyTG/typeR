library(aidar)


### Name: getCloud3D
### Title: retrieves a given 3D cloud by it's name from the given file and
###   returns it as a data.frame
### Aliases: getCloud3D
### Keywords: aida cloud

### ** Examples

histoFile = system.file("extdata", "clouds.xml.gz", package="aidar")
c3d = getCloud3D(histoFile, '33')



