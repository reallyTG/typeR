library(phreeqc)


### Name: phrSetErrorStringsOn
### Title: Set error strings on/off.
### Aliases: phrSetErrorStringsOn

### ** Examples


# This example attempts to run ex1, fails, and displays the error message
# (no database is loaded).
phrSetErrorStringsOn(TRUE)
if (!is.null(try(phrRunString(ex1), silent=TRUE))) {
  cat(phrGetErrorStrings(), "\n")
}




