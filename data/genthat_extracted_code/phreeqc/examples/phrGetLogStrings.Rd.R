library(phreeqc)


### Name: phrGetLogStrings
### Title: Retrieve log output.
### Aliases: phrGetLogStrings

### ** Examples


# This example equilibrates pure water with gypsum with the output file on.
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputFileOn(TRUE)

input <- vector(mode="character")
input <- c(input, "SOLUTION 1 Pure water ")
input <- c(input, "EQUILIBRIUM_PHASES 1  ")
input <- c(input, "  Gypsum 0 10         ")
input <- c(input, "KNOBS                 ")
input <- c(input, "  -logfile TRUE       ")

if (is.null(phrRunString(input))) {
  log <- phrGetLogStrings()
}




