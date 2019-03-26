library(phreeqc)


### Name: ex22
### Title: Example 22-Modeling Gas Solubilities: CO2 at High Pressures
### Aliases: ex22
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex22)
phrGetOutputStrings()




