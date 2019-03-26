library(phreeqc)


### Name: phrGetWarningStrings
### Title: Retrieve warning messages.
### Aliases: phrGetWarningStrings

### ** Examples


# This example loads the phreeqc.dat database and attempts to use the
# DATABASE keyword to set the database to wateq4f.dat.  A warning is
# displayed stating that the DATABASE keyword is ignored in the 'R'
# implementation.
phrLoadDatabaseString(phreeqc.dat)
phrAccumulateLine("DATABASE wateq4f.dat")
phrAccumulateLine("SOLUTION 1")
phrRunAccumulated()
if (!is.null(phrGetWarningStrings())) {
  cat(phrGetWarningStrings(), sep = "\n")
}




