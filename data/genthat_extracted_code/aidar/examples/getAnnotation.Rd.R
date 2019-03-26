library(aidar)


### Name: getAnnotation
### Title: retrieves the annotation of a given AIDA object by it's name
###   from the given file
### Aliases: getAnnotation
### Keywords: aida annotation

### ** Examples

histoFile = system.file("extdata", "histos.xml.gz", package="aidar")
ann = getAnnotation(histoFile, '21')



