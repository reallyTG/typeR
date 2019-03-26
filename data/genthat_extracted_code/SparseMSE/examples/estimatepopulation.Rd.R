library(SparseMSE)


### Name: estimatepopulation
### Title: Estimate the total population including the dark figure
### Aliases: estimatepopulation

### ** Examples

data(NewOrl)
data(NewOrl_5)
estimatepopulation(NewOrl, method="stepwise", quantiles=c(0.025,0.975))
estimatepopulation(NewOrl_5, method="main", quantiles=c(0.01, 0.05,0.95, 0.99))




