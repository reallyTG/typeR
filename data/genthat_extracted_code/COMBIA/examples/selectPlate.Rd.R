library(COMBIA)


### Name: selectPlate
### Title: Select one of the two read plates and built a hashtable. One
###   plate from each pair of the read plate is selected in case of double
###   plate experinment on the basis of presence of minimum selection key
###   and if none have maxed out values then one with highest mean value is
###   picked.
### Aliases: selectPlate

### ** Examples

f <- system.file("extdata", "optima.log", package="COMBIA")
fileDF <- readFile(filename = f, separator = "\t", noofrows_skip=0,
                   platetype = "384") 
Generatedbarcode <- Generatedbarcode <- extractKey(keyposition = 2,
    rawdata = fileDF, numberofrowsperplate = 17, doubleplateexperiment = TRUE) 
hashedplates <-  selectPlate(rawdata = fileDF,
    processedbarcode = Generatedbarcode, numberofrowsperplate=17,
    selectionkey="65000", doubleplateexperiment = TRUE  )



