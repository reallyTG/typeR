library(flexmix)


### Name: stepFlexmix
### Title: Run FlexMix Repeatedly
### Aliases: stepFlexmix initFlexmix initMethod stepFlexmix-class
###   initMethod-class plot,stepFlexmix,missing-method
###   show,stepFlexmix-method getModel,stepFlexmix-method
###   unique,stepFlexmix-method
### Keywords: cluster regression

### ** Examples

data("Nclus", package = "flexmix")

## try 2 times for k = 4
set.seed(511)
ex1 <- initFlexmix(Nclus~1, k = 4, model = FLXMCmvnorm(diagonal = FALSE),
                   nrep = 2)
ex1

## now 2 times each for k = 2:5, specify control parameter
ex2 <- initFlexmix(Nclus~1, k = 2:5, model = FLXMCmvnorm(diagonal = FALSE),
                   control = list(minprior = 0), nrep = 2)
ex2
plot(ex2)

## get BIC values
BIC(ex2)

## get smallest model
getModel(ex2, which = 1)

## get model with 3 components
getModel(ex2, which = "3")

## get model with smallest ICL (here same as for AIC and BIC: true k = 4)
getModel(ex2, which = "ICL")

## now 1 time each for k = 2:5, with larger minimum prior
ex3 <- initFlexmix(Nclus~1, k = 2:5,
                   model = FLXMCmvnorm(diagonal = FALSE),
                   control = list(minprior = 0.1), nrep = 1)
ex3

## keep only maximum likelihood solution for each unique number of
## fitted clusters:
unique(ex3)



