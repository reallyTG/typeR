library(phreeqc)


### Name: ex19
### Title: Example 19-Modeling Cd+2 Sorption With Linear, Freundlich, and
###   Langmuir Isotherms, and With a Deterministic Distribution of Sorption
###   Sites for Organic Matter, Clay Minerals, and Iron Oxyhydroxides
### Aliases: ex19
### Keywords: dataset

### ** Examples


phrLoadDatabaseString(phreeqc.dat)
phrSetOutputStringsOn(TRUE)
phrRunString(ex19)
phrGetOutputStrings()




