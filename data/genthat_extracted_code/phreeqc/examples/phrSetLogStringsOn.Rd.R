library(phreeqc)


### Name: phrSetLogStringsOn
### Title: Set log strings on/off.
### Aliases: phrSetLogStringsOn

### ** Examples


# This example runs ex2 with log strings turned on.
phrLoadDatabaseString(phreeqc.dat)
phrSetLogStringsOn(TRUE)

# turn logging on
phrAccumulateLine("KNOBS; -logfile true")
phrRunAccumulated()

if (is.null(phrRunString(ex2))) {
  cat(phrGetLogStrings(), sep = "\n")
}




