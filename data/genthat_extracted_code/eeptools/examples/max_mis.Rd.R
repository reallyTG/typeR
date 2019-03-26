library(eeptools)


### Name: max_mis
### Title: A function to safely take the maximum of a vector that could
###   include only NAs.
### Aliases: max_mis

### ** Examples

max(c(7,NA,3,2,0),na.rm=TRUE)
max_mis(c(7,NA,3,2,0))
max(c(NA,NA,NA,NA),na.rm=TRUE)
max_mis(c(NA,NA,NA,NA))




