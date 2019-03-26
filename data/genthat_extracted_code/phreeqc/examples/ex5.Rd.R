library(phreeqc)


### Name: ex5
### Title: Example 5-Irreversible Reactions
### Aliases: ex5
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex5)
phrGetOutputStrings()




