library(phreeqc)


### Name: ex15
### Title: Example 15-1D Transport: Kinetic Biodegradation, Cell Growth,
###   and Sorption
### Aliases: ex15
### Keywords: dataset

### ** Examples


# this example takes longer than 5 seconds
phrLoadDatabaseString(ex15.dat)
phrSetOutputStringsOn(TRUE)
## Not run: phrRunString(ex15)
phrGetOutputStrings()




