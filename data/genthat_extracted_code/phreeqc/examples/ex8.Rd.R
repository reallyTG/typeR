library(phreeqc)


### Name: ex8
### Title: Example 8-Surface Complexation
### Aliases: ex8
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
# example 8 requires the selected_output file to be turned on
phrSetSelectedOutputFileOn(1, TRUE)
phrRunString(ex8)
phrGetOutputStrings()




