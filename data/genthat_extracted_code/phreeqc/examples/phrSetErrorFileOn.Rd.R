library(phreeqc)


### Name: phrSetErrorFileOn
### Title: Set error file on/off.
### Aliases: phrSetErrorFileOn

### ** Examples


# This example attempts to run ex1, fails, and writes the error
# message to the error file (no database is loaded).
phrSetErrorFileOn(TRUE)
phrSetErrorFileName("phreeqc.errors")
if (!is.null(try(phrRunString(ex1), silent=TRUE))) {
  cat("see", phrGetErrorFileName(), "\n")
}




