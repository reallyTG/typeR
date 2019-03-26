library(LEGIT)


### Name: rGE.IMLEGIT
### Title: Gene-Environment correlation estimation and testing of IMLEGIT
###   models
### Aliases: rGE.IMLEGIT

### ** Examples

# Note: These examples don't have G and E correlation so the model fit doesn't change 
# but this shows how to use the rGE function
train = example_3way_3latent(500, 1, seed=777)
fit = IMLEGIT(train$data, train$latent_var, y ~ G*E*Z)
# If we assume Z not to be an "environment"
fit_rGE1 = rGE(fit, y ~ G*E, train$latent_var, 2, 1)
fit_rGE1
summary(fit_rGE1$fit_main_resid)
# If we assume Z to be an "environment"
fit_rGE2 = rGE(fit, y ~ G*E, train$latent_var, c(2,3), 1)
fit_rGE2
summary(fit_rGE2$fit_main_resid)



