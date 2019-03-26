library(assist)


### Name: intervals.slm
### Title: Calculate Predictions and Posterior Standard Deviations of
###   Spline Estimates From a slm Object
### Aliases: intervals.slm
### Keywords: file

### ** Examples

data(dog)
# fit a SLM model with random effects for dogs
dog.fit<-slm(y~group*time, rk=list(cubic(time), shrink1(group),
    rk.prod(kron(time-0.5),shrink1(group)),rk.prod(cubic(time), 
    shrink1(group))), random=list(dog=~1), data=dog)

intervals(dog.fit)



