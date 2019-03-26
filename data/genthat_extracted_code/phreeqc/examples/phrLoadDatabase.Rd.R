library(phreeqc)


### Name: phrLoadDatabase
### Title: Load a phreeqc database file
### Aliases: phrLoadDatabase

### ** Examples


# create temporary database file
tf <- tempfile()
writeLines(phreeqc.dat, tf)

if (is.null(phrLoadDatabase(tf))) {
  cat("database ok\n")
} else {
  cat("database contains errors\n")
}

# delete temporary database file
unlink(tf)




