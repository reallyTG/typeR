library(PELVIS)


### Name: indivSexing
### Title: Internal function for sexing one single human os coxae using
###   revised Bruzek's method (2018)
### Aliases: indivSexing

### ** Examples

data(refData)
# Pick the first individual of the reference dataset with its 11 traits, as an example:
individual <- refData[1, -c(1:6)]
individual
# Produce a sex estimate for this individual:
indivSexing(ref=refData, newInd=individual)



