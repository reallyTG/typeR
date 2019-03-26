library(ivpack)


### Name: cluster.robust.se
### Title: cluster.robust.se
### Aliases: cluster.robust.se
### Keywords: ~kwd1 ~kwd2

### ** Examples

# For Card's data, fit an IV model of log wage on the treatment variable (education) 
# using the IV nearc4, with measured covariates (included exogenous variables) 
# exper, expersq, black, south, smsa, smsa66
data(card.data)
ivmodel=ivreg(lwage ~ educ + exper + expersq + black + south + smsa + smsa66, 
~ nearc4 + exper + expersq + black + south + smsa + smsa66, x=TRUE, data=card.data)
# Compute cluster robust standard errors when the clustering is by region
cluster.robust.se(ivmodel, card.data$region)



