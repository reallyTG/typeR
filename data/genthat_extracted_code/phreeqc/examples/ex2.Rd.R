library(phreeqc)


### Name: ex2
### Title: Example 2-Equilibration With Pure Phases
### Aliases: ex2
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex2)
phrGetOutputStrings()




