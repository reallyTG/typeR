library(phreeqc)


### Name: ex17
### Title: Example 17-Inverse Modeling With Evaporation
### Aliases: ex17
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(pitzer.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex17)
phrGetOutputStrings()




