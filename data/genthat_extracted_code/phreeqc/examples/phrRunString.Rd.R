library(phreeqc)


### Name: phrRunString
### Title: Runs phreeqc using the given string as input.
### Aliases: phrRunString
### Keywords: interface

### ** Examples


#
# This example accumulates phreeqc input into a character vector
# and runs it.
#

# load phreeqc.dat file
phrLoadDatabaseString(phreeqc.dat)

# create input
input <- vector()
input <- c(input, "SOLUTION 1") 
input <- c(input, "  temp 25.0") 
input <- c(input, "  pH    7.0")

# turn on output
phrSetOutputFileOn(TRUE)

# run input
phrRunString(input)
cat(paste("see", phrGetOutputFileName(), "."))




