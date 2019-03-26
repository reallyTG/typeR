library(PracTools)


### Name: nhispart
### Title: National Health Interview Survey data from 2003: socioeconomic
###   variables
### Aliases: nhispart
### Keywords: datasets

### ** Examples

data(nhispart)
str(nhispart)
table(nhispart$STRATUM, nhispart$PSU)
table(nhispart$RACERPI2, nhispart$RACRECI2, useNA="always")



