library(AcceptanceSampling)


### Name: OCvar
### Title: Operating Characteristics of an Acceptance Sampling Plan
### Aliases: OCvar plot,OCvar-method plot,OCnormal,missing-method
###   plot,numeric,OCnormal-method show,OCvar-method summary,OCvar-method
### Keywords: classes

### ** Examples

## A normal sampling plan - st. dev. known
x <- OCvar(14, 1.205)
x ## print out a brief summary
plot(x) ## plot the OC curve
plot(x, xlim=c(0,0.4)) ## plot the useful part of the OC curve

## Assess whether the plan can meet desired risk points
assess(x, PRP=c(0.05, 0.95), CRP=c(0.2, 0.1))

summary(x, full=TRUE)



