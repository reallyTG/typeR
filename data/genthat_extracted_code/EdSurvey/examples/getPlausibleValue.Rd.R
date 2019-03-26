library(EdSurvey)


### Name: getPlausibleValue
### Title: Get Plausible Value Variables
### Aliases: getPlausibleValue

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))

getPlausibleValue(var="composite", data=sdf)



