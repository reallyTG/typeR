library(TSA)


### Name: runs
### Title: Runs test
### Aliases: runs
### Keywords: methods

### ** Examples

data(tempdub)
month.=season(tempdub) # the period sign is included to make the printout from
# the following command clearer.
model3=lm(tempdub~month.) # intercept is automatically included so one month (Jan) is dropped
summary(model3)
runs(rstudent(model3))



