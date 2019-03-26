library(phreeqc)


### Name: ex1
### Title: Example 1-Speciation Calculation
### Aliases: ex1
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex1)
phrGetOutputStrings()




