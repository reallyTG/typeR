library(COMBIA)


### Name: extractKey
### Title: Extracts the keyvalues (Barcode) from a dataset, every plate
###   needs barcode. Keyvalues are extracted from the header of the plates
###   at the position specified by keyposition argument.
### Aliases: extractKey

### ** Examples

f <- system.file("extdata", "optima.log", package="COMBIA")
fileDF <- readFile(filename = f,  separator = "\t", noofrows_skip=0,
                   platetype="384")  
Generatedbarcode <- extractKey(keyposition = 2, rawdata = fileDF, 
                              numberofrowsperplate = 17, 
                              doubleplateexperiment = TRUE) 



