library(vcdExtra)


### Name: Detergent
### Title: Detergent preference data
### Aliases: Detergent
### Keywords: datasets

### ** Examples

data(Detergent)

# example goes here
mosaic(Detergent, shade=TRUE)

require(MASS)
(det.mod0 <- loglm(~ Preference + Temperature + M_User + Water_softness, data=Detergent))
# examine addition of two-way terms
add1(det.mod0, ~ .^2, test="Chisq")

# model for Preference as a response
(det.mod1 <- loglm(~ Preference + (Temperature * M_User * Water_softness), data=Detergent))
mosaic(det.mod0)





