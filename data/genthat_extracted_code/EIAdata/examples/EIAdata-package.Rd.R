library(EIAdata)


### Name: EIAdata-package
### Title: R wrapper for the US Energy Information Administration's (EIA's)
###   API.
### Aliases: EIAdata-package EIAdata
### Keywords: EIAdata

### ** Examples

## No test: 
# \donttest is used here because the functions require a valid EIA API key.
# While API keys are free, they are best kept private.

# Be sure to load your EIA key.  You can request one
# here: http://www.eia.gov/beta/api/register.cfm

key <- "your_key"

# To see the top of the data category hierarchy.

getCatEIA(key=key)

# To see the subcategories and data sets in a particular category (for example 40827).

getCatEIA(key=key, cat=40827)

# To download and return a time series object of class xts
# for example ELEC.PLANT.GEN.13-WAT-ALL.Q

getQEIA(ID = "ELEC.PLANT.GEN.13-WAT-ALL.Q", key = key)

# The if the EIA series ID contains a "-", the function will replace
# this with a ".".  So the call above will return a time series of
# class xts named ELEC.PLANT.GEN.13.WAT.ALL.Q
## End(No test)



