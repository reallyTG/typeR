library(phreeqc)


### Name: phrLoadDatabaseString
### Title: Load a phreeqc database as a string or a list of strings.
### Aliases: phrLoadDatabaseString
### Keywords: interface

### ** Examples


# this example loads the phreeqc.dat database, turns on the
# output file and runs ex2 as a string
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputFileOn(TRUE)
if (is.null(phrRunString(ex2))) {
  cat(paste("see ", phrGetOutputFileName(), ".\n", sep = ""))
}




