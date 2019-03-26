library(aidar)


### Name: getProfile2D
### Title: retrieves a given 2D profile histogram by it's name from the
###   given file and returns it as a data.frame
### Aliases: getProfile2D
### Keywords: aida histogram profile

### ** Examples

histoFile = system.file("extdata", "histos.xml.gz", package="aidar")
p2d = getProfile2D(histoFile, 'Example 2D profile (gauss)')



