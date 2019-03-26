library(phreeqc)


### Name: ex14
### Title: Example 14-Advective Transport, Cation Exchange, Surface
###   Complexation, and Mineral Equilibria
### Aliases: ex14
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex14)
phrGetOutputStrings()




