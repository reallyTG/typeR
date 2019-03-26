library(phreeqc)


### Name: phrGetOutputFileName
### Title: Retrieve the name of the output file.
### Aliases: phrGetOutputFileName

### ** Examples


# This example equilibrates pure water with gypsum with the output file on.
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputFileOn(TRUE)

input <- vector(mode="character")
input <- c(input, "SOLUTION 1 Pure water ")
input <- c(input, "EQUILIBRIUM_PHASES 1  ")
input <- c(input, "  Gypsum 0 10         ")

if (is.null(phrRunString(input))) {
  output <- readLines(phrGetOutputFileName())
  unlink(phrGetOutputFileName())  # tidy up
}




