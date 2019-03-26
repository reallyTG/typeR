library(phreeqc)


### Name: ex21
### Title: Example 21-Modeling Diffusion of HTO, 36Cl-, 22Na+, and Cs+ in a
###   Radial Diffusion Cell
### Aliases: ex21
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
# example 21 requires the selected_output file to be turned on
phrSetSelectedOutputFileOn(1, TRUE)
phrSetOutputStringsOn(TRUE)
# this takes longer than 5 seconds
## Not run: phrRunString(ex21)
phrGetOutputStrings()




