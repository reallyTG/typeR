library(aidar)


### Name: getProfile1D
### Title: retrieves a given 1D profile histogram by it's name from the
###   given file and returns it as a data.frame
### Aliases: getProfile1D
### Keywords: aida histogram profile

### ** Examples

histoFile = system.file("extdata", "histos.xml.gz", package="aidar")
p1d = getProfile1D(histoFile, 'Example profile (gauss)')



