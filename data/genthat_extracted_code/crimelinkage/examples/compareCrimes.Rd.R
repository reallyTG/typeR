library(crimelinkage)


### Name: compareCrimes
### Title: Creates evidence variables by calculating 'distance' between
###   crime pairs
### Aliases: compareCrimes

### ** Examples

data(crimes)
 pairs = t(combn(crimes$crimeID[1:4],m=2))   # make some crime pairs

 varlist = list(
   spatial = c("X", "Y"),
   temporal = c("DT.FROM","DT.TO"),
   categorical = c("MO1",  "MO2", "MO3"))    # crime variables list

 compareCrimes(pairs,crimes,varlist,binary=TRUE)



