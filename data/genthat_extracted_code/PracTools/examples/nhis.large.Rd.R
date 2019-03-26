library(PracTools)


### Name: nhis.large
### Title: National Health Interview Survey: Demographic and health
###   variables
### Aliases: nhis.large
### Keywords: datasets

### ** Examples

data(nhis.large)
str(nhis.large)
table(nhis.large$stratum, nhis.large$psu)
table(nhis.large$delay.med, useNA="always")


