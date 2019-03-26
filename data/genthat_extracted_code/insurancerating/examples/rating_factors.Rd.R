library(insurancerating)


### Name: rating_factors
### Title: Include reference group in regression output
### Aliases: rating_factors

### ** Examples

g1 <- glm(nclaims ~ age_policyholder, family = "poisson", data = MTPL)
rating_factors(g1)



