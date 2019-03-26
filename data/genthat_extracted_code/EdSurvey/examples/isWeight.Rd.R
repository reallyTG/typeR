library(EdSurvey)


### Name: isWeight
### Title: Weight Test
### Aliases: isWeight

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

# True
isWeight(var="origwt", data=sdf)

# False
isWeight(var="dsex", data=sdf)



