library(EdSurvey)


### Name: showPlausibleValues
### Title: Plausible Value Variable Names
### Aliases: showPlausibleValues

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))

# show the plausible values
showPlausibleValues(data=sdf, verbose=TRUE)



