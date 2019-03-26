library(scan)


### Name: writeSC
### Title: Export data into a .csv-file
### Aliases: writeSC
### Keywords: manip

### ** Examples

## Write single-case data to a .csv-file
jessica <- rSC(d.level = .5)
writeSC(jessica, "SCdata_Jessica.csv")

## Write multiple cases to a .csv-file with semicolon as field and comma as decimal separator
writeSC(Grosche2011, "MBDdata_Grosche.csv", sep = ";", dec = ",")



