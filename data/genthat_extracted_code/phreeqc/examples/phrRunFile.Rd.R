library(phreeqc)


### Name: phrRunFile
### Title: Run phreeqc input file
### Aliases: phrRunFile

### ** Examples


# load the phreeqc.dat database
phrLoadDatabaseString(phreeqc.dat)

# create ex2 if it doesn't exist
if (!file.exists("ex2")) writeLines(ex2, "ex2")

# run ex2
if (is.null(phrRunFile("ex2"))) {
  cat("use phrGetSelectedOutput() to see results.")
}

unlink("ex2")  # tidy up




