library(projpred)


### Name: proj-pred
### Title: Extract draws of the linear predictor and draw from the
###   predictive distribution of the projected submodel
### Aliases: proj-pred proj_linpred proj_predict

### ** Examples

## No test: 
### Usage with stanreg objects
fit <- stan_glm(y~x, binomial())
vs <- varsel(fit)

# compute predictions with 4 variables at the training points
pred <- proj_linpred(vs, xnew=x, nv = 4)
pred <- proj_predict(vs, xnew=x, nv = 4)

## End(No test)




