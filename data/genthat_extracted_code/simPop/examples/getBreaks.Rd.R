library(simPop)


### Name: getBreaks
### Title: Compute break points for categorizing (semi-)continuous
###   variables
### Aliases: getBreaks
### Keywords: manip

### ** Examples


data(eusilcS)

# semi-continuous variable, positive break points equidistant
getBreaks(eusilcS$netIncome, weights=eusilcS$rb050)

# semi-continuous variable, positive break points not equidistant
getBreaks(eusilcS$netIncome, weights=eusilcS$rb050,
    equidist = FALSE)




