library(aidar)


### Name: getTuple
### Title: retrieves a given tuple by it's name from the given file and
###   returns it as a data.frame
### Aliases: getTuple
### Keywords: aida tuple

### ** Examples

tupleFile = system.file("extdata", "tuple.xml.gz", package="aidar")
t100 = getTuple(tupleFile, '100')



