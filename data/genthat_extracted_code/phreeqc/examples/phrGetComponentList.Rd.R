library(phreeqc)


### Name: phrGetComponentList
### Title: Retrieve a list containing the current list of components.
### Aliases: phrGetComponentList

### ** Examples


# This example runs the ex2 input file and echos the list of components.
phrLoadDatabaseString(phreeqc.dat)
phrRunString(ex2)
cat("components:\n")
for (comp in phrGetComponentList()) {
  cat(comp, "\n")
}




