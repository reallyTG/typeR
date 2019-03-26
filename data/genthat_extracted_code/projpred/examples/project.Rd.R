library(projpred)


### Name: project
### Title: Projection to submodels
### Aliases: project

### ** Examples

## No test: 
### Usage with stanreg objects
fit <- stan_glm(y~x, binomial())
vs <- varsel(fit)

# project onto the best model with 4 variables
proj4 <- project(vs, nv = 4)

# project onto an arbitrary variable combination (variable indices 3,4 and 8)
proj <- project(fit, vind=c(3,4,8))
## End(No test)




