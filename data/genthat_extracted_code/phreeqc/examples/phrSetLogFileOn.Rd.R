library(phreeqc)


### Name: phrSetLogFileOn
### Title: Set log file on/off.
### Aliases: phrSetLogFileOn

### ** Examples


# This example runs ex2 with the log file turned on.
phrLoadDatabaseString(phreeqc.dat)
phrSetLogStringsOn(TRUE)

# turn logging on
phrAccumulateLine("KNOBS; -logfile true")
phrRunAccumulated()

if (is.null(phrRunString(ex2))) {
  cat("see", phrGetLogFileName(), "\n")
}




