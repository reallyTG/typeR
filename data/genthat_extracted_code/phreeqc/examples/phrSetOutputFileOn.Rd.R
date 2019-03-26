library(phreeqc)


### Name: phrSetOutputFileOn
### Title: Set output file on/off.
### Aliases: phrSetOutputFileOn

### ** Examples


# This example runs ex2 with the output file turned on.

# write temporary input file
tf <- tempfile()
writeLines(ex2, tf)

# load database and run input file
phrLoadDatabaseString(phreeqc.dat)
phrSetOutputFileOn(TRUE)
if (is.null(phrRunFile(tf))) {
  cat("see", phrGetOutputFileName(), "\n")
}

# delete temporary input file
unlink(tf)




