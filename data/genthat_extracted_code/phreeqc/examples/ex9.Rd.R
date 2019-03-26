library(phreeqc)


### Name: ex9
### Title: Example 9-Kinetic Oxidation of Dissolved Ferrous Iron With
###   Oxygen
### Aliases: ex9
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex9)
phrGetOutputStrings()




