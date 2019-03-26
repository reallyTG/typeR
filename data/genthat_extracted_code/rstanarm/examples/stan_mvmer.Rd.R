library(rstanarm)


### Name: stan_mvmer
### Title: Bayesian multivariate generalized linear models with correlated
###   group-specific terms via Stan
### Aliases: stan_mvmer

### ** Examples

## No test: 
#####
# A multivariate GLM with two submodels. For the grouping factor 'id', the 
# group-specific intercept from the first submodel (logBili) is assumed to
# be correlated with the group-specific intercept and linear slope in the 
# second submodel (albumin)
f1 <- stan_mvmer(
        formula = list(
          logBili ~ year + (1 | id), 
          albumin ~ sex + year + (year | id)),
        data = pbcLong, 
        # this next line is only to keep the example small in size!
        chains = 1, cores = 1, seed = 12345, iter = 1000)
summary(f1) 

#####
# A multivariate GLM with one bernoulli outcome and one
# gaussian outcome. We will artificially create the bernoulli
# outcome by dichotomising log serum bilirubin
pbcLong$ybern <- as.integer(pbcLong$logBili >= mean(pbcLong$logBili))
f2 <- stan_mvmer(
        formula = list(
          ybern ~ year + (1 | id), 
          albumin ~ sex + year + (year | id)),
        data = pbcLong,
        family = list(binomial, gaussian),
        chains = 1, cores = 1, seed = 12345, iter = 1000)
## End(No test)




