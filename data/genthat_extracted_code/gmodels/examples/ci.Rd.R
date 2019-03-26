library(gmodels)


### Name: ci
### Title: Compute Confidence Intervals
### Aliases: ci ci.numeric ci.binom ci.lm ci.lme ci.estimable
###   ci.fit_contrast
### Keywords: regression

### ** Examples


# mean and confidence interval
ci( rnorm(10) )

# binomial proportion and exact confidence interval
b <- rbinom( prob=0.75, size=1, n=20 )
ci.binom(b) # direct call
class(b) <- 'binom'
ci(b)       # indirect call

# confidence intervals for regression parameteres
data(state)
reg  <-  lm(Area ~ Population, data=as.data.frame(state.x77))
ci(reg)






