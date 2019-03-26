library(BradleyTerry2)


### Name: glmmPQL
### Title: PQL Estimation of Generalized Linear Mixed Models
### Aliases: glmmPQL
### Keywords: models

### ** Examples


###############################################
## Crowder seeds example from Breslow & Clayton
###############################################

summary(glmmPQL(cbind(r, n - r) ~ seed + extract,
        random = diag(nrow(seeds)),
        family = "binomial", data = seeds))

summary(glmmPQL(cbind(r, n - r) ~ seed*extract,
                random = diag(nrow(seeds)),
                family = "binomial", data = seeds))




