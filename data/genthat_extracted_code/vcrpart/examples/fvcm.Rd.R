library(vcrpart)


### Name: fvcm
### Title: Bagging and Random Forests based on 'tvcm'
### Aliases: fvcm fvcm_control fvcolmm fvcolmm_control fvcglm
###   fvcglm_control
### Keywords: models

### ** Examples

## ------------------------------------------------------------------- #
## Dummy example:
##
## Bagging 'tvcm' on the artificially generated data 'vcrpart_3'. The 
## true coefficient function is a sinus curve between -pi/2 and pi/2. 
## The parameters 'maxstep = 3' and 'K = 5' are chosen to restrict the 
## computations.
## ------------------------------------------------------------------- #

## simulated data
data(vcrpart_3)

## setting parameters
control <-
  fvcm_control(maxstep = 3, 
               folds = folds_control("subsampling", K = 5, 0.5, seed = 3))

## fitting the forest
model <- fvcm(y ~ vc(z1, by = x1), data = vcrpart_3, 
              family = gaussian(), control = control)

## plot the first two trees
plot(model, "coef", 1:2)

## plotting the partial dependency of the coefficient for 'x1'
plot(model, "partdep")



