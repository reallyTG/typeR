library(ofGEM)


### Name: ofGEM
### Title: A meta-analysis approach with filtering for identifying
###   gene-level gene-environment interactions with genetic association
###   data
### Aliases: ofGEM

### ** Examples



data(sim_dat)

pval = ofGEM(Z = sim_dat$Z, X = sim_dat$X, R = sim_dat$R, weight = rep(1/6, 6))





