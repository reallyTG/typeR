library(EdSurvey)


### Name: hasPlausibleValue
### Title: Plausible Value Test
### Aliases: hasPlausibleValue

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

# True
hasPlausibleValue(var="composite", data=sdf)

# False
hasPlausibleValue(var="dsex", data=sdf)



