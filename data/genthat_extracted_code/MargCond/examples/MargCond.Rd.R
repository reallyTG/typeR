library(MargCond)


### Name: MargCond
### Title: Function to fit joint marginal-conditional models for
###   longitudinal multivariate data.
### Aliases: MargCond print.MargCond summary.MargCond
###   print.summary.MargCond Ebi Vbi expandR getUi reForm reScale
### Keywords: models regression multivariate

### ** Examples

set.seed(2112)
NN = 80
n_times = 1:3

## Simulating some data
simdat <- simDat(n = NN, 
                 fixed_effects = list(c(1, 1, 2), c(1.5, 1, 3)), 
                 rand_effects = list(1, 1),
                 error_var = c(4, 4),
                 error_structure = 'normal',
                 rho = .35,
                 times = n_times,
                 X = cbind(rep(1, NN * length(n_times)), 
                           rnorm(NN * length(n_times), 0, 2), 
                           rbinom(NN * length(n_times), 1, .5)),
                 Z = cbind(rep(1, NN * length(n_times))))
                  
## Adding random missing values
aa <- sample(1:nrow(simdat), 10, replace = TRUE)
bb <- sample(1:7, 10, replace = TRUE)
for (i in 1:length(aa)) {
  simdat[aa[i], bb[i]] <- NA
}

## A fit for this simulated multivariate longitudinal data, 
## including a random intercept and exchangeable correlation 
## structure.
summary(MargCond(c(outcome1, outcome2) ~ X2 + X3 + (1 | ID), 
        data = simdat, ID = simdat$ID, corstr = "exchangeable"))



