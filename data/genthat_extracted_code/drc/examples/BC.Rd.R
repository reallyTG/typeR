library(drc)


### Name: BC.5
### Title: The Brain-Cousens hormesis models
### Aliases: BC.5 bcl4 BC.4 bcl3
### Keywords: models nonlinear

### ** Examples


## Fitting the data in van Ewijk and Hoekstra (1993)
lettuce.bcm1 <- drm(weight ~ conc, data = lettuce, fct=BC.5())
modelFit(lettuce.bcm1)
plot(lettuce.bcm1)

lettuce.bcm2 <- drm(weight ~conc, data = lettuce, fct=BC.4())
summary(lettuce.bcm2)
ED(lettuce.bcm2, c(50))  
# compare the parameter estimate and 
# its estimated standard error 
# to the values in the paper by 
# van Ewijk and Hoekstra (1993)


## Brain-Cousens model with the constraint b>3
ryegrass.bcm1 <- drm(rootl ~conc, data = ryegrass, fct = BC.5(), 
lower = c(3, -Inf, -Inf, -Inf, -Inf), control = drmc(constr=TRUE))

summary(ryegrass.bcm1)

## Brain-Cousens model with the constraint f>0 
## (no effect as the estimate of f is positive anyway)
ryegrass.bcm2 <- drm(rootl ~conc, data = ryegrass, fct = BC.5(), 
lower = c(-Inf, -Inf, -Inf, -Inf, 0), control = drmc(constr=TRUE))

summary(ryegrass.bcm2)




