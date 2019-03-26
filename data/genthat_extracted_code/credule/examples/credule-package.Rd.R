library(credule)


### Name: credule-package
### Title: Credit Default Swap pricing and Credit Curve bootstrapping
### Aliases: credule-package
### Keywords: Credit Default Swap, Credit Default Swaps, CDS, spread,
###   survival probability, survival probabilities, default probability,
###   default probabilities, pricing, credit curve, bootstrapping, hazard
###   rate, poisson process

### ** Examples

library(credule)

yieldcurveTenor = c(1,2,3,4,5,7)
yieldcurveRate = c(0.0050,0.0070,0.0080,0.0100, 0.0120,0.0150)
creditcurveTenor = c(1,3,5,7)
creditcurveSP = c(0.99,0.98,0.95,0.92)
cdsTenors = c(1,3,5,7)
cdsSpreads = c(0.0050,0.0070,0.00100,0.0120)
premiumFrequency = 4
defaultFrequency = 12
accruedPremium = TRUE
RR = 0.40

# CDS pricing
res_price = priceCDS(yieldcurveTenor,
            yieldcurveRate,
            creditcurveTenor,
            creditcurveSP,
            cdsTenors,
            RR,
            premiumFrequency,
            defaultFrequency,
            accruedPremium
          )
res_price

# Credit curve bootstrapping from CDS spreads
res_bootstrap = bootstrapCDS(yieldcurveTenor,
             yieldcurveRate,
             res_price$tenor,
             res_price$spread,
             RR,
             premiumFrequency,
             defaultFrequency,
             accruedPremium)
res_bootstrap




