library(dsm)


### Name: rqgam.check
### Title: Randomised quantile residuals check plot for GAMs/DSMs
### Aliases: rqgam.check

### ** Examples

## No test: 
library(Distance)
library(dsm)
library(tweedie)

# load the Gulf of Mexico dolphin data (see ?mexdolphins)
data(mexdolphins)

# fit a detection function and look at the summary
hr.model <- ds(distdata, max(distdata$distance),
               key = "hr", adjustment = NULL)

# fit a simple smooth of x and y with a Tweedie response with estimated
#  p parameter
mod1 <- dsm(count~s(x, y), hr.model, segdata, obsdata, family=tw())
rqgam.check(mod1)
## End(No test)



