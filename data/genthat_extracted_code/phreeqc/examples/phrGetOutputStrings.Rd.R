library(phreeqc)


### Name: phrGetOutputStrings
### Title: Retrieve standard phreeqc output.
### Aliases: phrGetOutputStrings

### ** Examples


# This example equilibrates pure water with calcite and displays
# the results
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)

input <- vector(mode="character")
input <- c(input, "SOLUTION 1 Pure water ")
input <- c(input, "EQUILIBRIUM_PHASES 1  ")
input <- c(input, "  Gypsum 0 10         ")

if (is.null(phrRunString(input))) {
  cat(phrGetOutputStrings(), sep = "\n")
}




