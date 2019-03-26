library(COMBIA)


### Name: readFile
### Title: Reads experimental data from a file. This function reads the
###   data from specified (excel,log, txt etc) file and store it in a data
###   frame.
### Aliases: readFile

### ** Examples

f <- system.file("extdata", "optima.log", package="COMBIA")
fileDF <- readFile(filename = f, separator ="\t", sheet=1, noofrows_skip=0,   
readplates=1, numberofrowsperplate=17, platetype="384")  



