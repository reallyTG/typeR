library(coxed)


### Name: user.baseline
### Title: Calculating baseline functions from a user-specified baseline
###   hazard function
### Aliases: user.baseline

### ** Examples

## Writing the hazard to be lognormal with mean of 50, sd of 10
my.hazard <- function(t){
     dnorm((log(t) - log(50))/log(10)) /
          (log(10)*t*(1 - pnorm((log(t) - log(50))/log(10))))
}
lognormal.functions <- user.baseline(my.hazard, 100)
summary(lognormal.functions)

#A customized user-specified hazard
sine.squared.hazard <- user.baseline(function(t) sin(t/25)^2, 30)
summary(sine.squared.hazard)



