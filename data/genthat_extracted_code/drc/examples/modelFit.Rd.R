library(drc)


### Name: modelFit
### Title: Assessing the model fit
### Aliases: modelFit
### Keywords: models nonlinear

### ** Examples


## Comparing the four-parameter log-logistic model 
##  to a one-way ANOVA model using an approximate F test
## in other words applying a lack-of-fit test
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = W1.4())
modelFit(ryegrass.m1)   




