library(gnm)


### Name: summary.gnm
### Title: Summarize Generalized Nonlinear Model Fits
### Aliases: summary.gnm print.summary.gnm
### Keywords: models regression nonlinear

### ** Examples

### First example from ?Dref
set.seed(1)

## reconstruct counts voting Labour/non-Labour
count <- with(voting, percentage/100 * total)
yvar <- cbind(count, voting$total - count)
     
## fit diagonal reference model with constant weights
classMobility <- gnm(yvar ~ -1 + Dref(origin, destination), 
                     family = binomial, data = voting)

## summarize results - note diagonal weights are over-parameterised
summary(classMobility)

## refit setting first weight to zero (as DrefWeights() does)
classMobility <- gnm(yvar ~ -1 + Dref(origin, destination), 
                     family = binomial, data = voting,
                     constrain = "delta1")
summary(classMobility)




