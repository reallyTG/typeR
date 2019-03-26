library(phreeqc)


### Name: ex20a
### Title: Example 20-Distribution of Isotopes Between Water and Calcite
### Aliases: ex20a ex20b
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(iso.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex20a)
phrGetOutputStrings()




