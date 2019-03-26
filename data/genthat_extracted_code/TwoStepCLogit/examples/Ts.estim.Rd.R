library(TwoStepCLogit)


### Name: Ts.estim
### Title: Two-Step Estimator
### Aliases: Ts.estim print.Ts.estim
### Keywords: models

### ** Examples

# Two ways for specifying the same model
# Data: bison
# Model: covariates forest, biomass and pmeadow
# Random effects in front of forest and biomass
# Main diagonal covariance structure for D (the default)
way1 <- Ts.estim(formula = Y ~ forest  + biomass + pmeadow + 
        strata(Strata) + cluster(Cluster), data = bison, 
        random = ~ forest + biomass)
way1
way2 <- Ts.estim(formula = bison[,3] ~ as.matrix(bison[,c(6,8:9)]) + 
        strata(bison[,2]) + cluster(bison[,1]), data = bison, 
        random = ~ as.matrix(bison[,c(6,8)]))
way2

# Unstructured covariance for D
Fit <- Ts.estim(formula = Y ~ forest  + biomass + pmeadow + 
        strata(Strata) + cluster(Cluster), data = bison, 
        random = ~ forest + biomass, D="UN")
Fit



