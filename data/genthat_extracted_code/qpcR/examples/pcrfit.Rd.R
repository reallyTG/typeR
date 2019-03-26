library(qpcR)


### Name: pcrfit
### Title: Workhorse function for qPCR model fitting
### Aliases: pcrfit
### Keywords: models nonlinear

### ** Examples

## Simple l4 fit of F1.1 of the 'reps' dataset.
m1 <- pcrfit(reps, 1, 2, l4) 
plot(m1)

## Supply own starting values.
pcrfit(reps, 1, 2, l4, start = c(-5, -0.05, 11, 16)) 

## Make a replicate model,
## use inverse variance as weights.
m2 <- pcrfit(reps, 1, 2:5, l5, weights = "1/error^2")
plot(m2)

## Fit a mechanistic 'mak2' model
## to -1 cycle from SDM.
m3 <- pcrfit(reps, 1, 2, mak2, offset = -1)
plot(m3)



