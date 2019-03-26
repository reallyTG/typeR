library(laeken)


### Name: prop
### Title: Proportion of an alternative distribution
### Aliases: prop
### Keywords: survey

### ** Examples

data(eusilc)

# overall value
prop("rb090", weights = "rb050", data = eusilc)

# values by region
prop("rb090", weights = "rb050",
    breakdown = "db040", data = eusilc)



