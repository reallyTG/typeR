library(credule)


### Name: bootstrapCDS
### Title: Bootstrap a Credit Curve
### Aliases: bootstrapCDS
### Keywords: Credit Default Swap, Credit Default Swaps, CDS, spread,
###   survival probability, survival probabilities, default probability,
###   default probabilities, pricing, credit curve, bootstrapping, hazard
###   rate, poisson process

### ** Examples

library(credule)

yieldcurveTenor = c(1,2,3,4,5,7)
yieldcurveRate = c(0.0050,0.0070,0.0080,0.0100, 0.0120,0.0150)
cdsTenors = c(1,3,5,7)
cdsSpreads = c(0.0050,0.0070,0.0090,0.0110)
premiumFrequency = 4
defaultFrequency = 12
accruedPremium = TRUE
RR = 0.40

bootstrapCDS(yieldcurveTenor,
             yieldcurveRate,
             cdsTenors,
             cdsSpreads,
             RR,
             premiumFrequency,
             defaultFrequency,
             accruedPremium)



