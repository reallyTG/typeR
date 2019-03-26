library(relSim)


### Name: readResults
### Title: Read a simulation result set from file
### Aliases: readResults

### ** Examples


data(fbiCaucs)
## not run
## write the results of 100 unrelated profile pairs to
## results-sim-UN-100.csv.gz
## and read it back in
## Not run: 
##D sim(100, save = T)
##D unrel = readResults(100)
##D sim(100, rel = "FS", strVer = "01", save = T)
##D sibs = readResults(100, rel = "FS", strVer = "01")
## End(Not run)




