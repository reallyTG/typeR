library(LEGIT)


### Name: rGE.LEGIT
### Title: Gene-Environment correlation estimation and testing of LEGIT
###   models
### Aliases: rGE.LEGIT

### ** Examples

# Note: These examples don't have G and E correlation so the model fit doesn't change
# but this shows how to use the rGE function
train = example_2way(500, 1, seed=777)
fit = LEGIT(train$data, train$G, train$E, y ~ G*E)
fit_rGE = rGE(fit, y ~ G*E)
fit_rGE
summary(fit_rGE$fit_main_resid)



