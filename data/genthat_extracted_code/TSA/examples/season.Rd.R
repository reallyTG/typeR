library(TSA)


### Name: season
### Title: Extract the season info from a time series
### Aliases: season
### Keywords: methods

### ** Examples

data(tempdub)
month.=season(tempdub) # the period sign is included to make the printout from
# the commands two line below clearer; ditto below.
model2=lm(tempdub~month.-1) # -1 removes the intercept term 
summary(model2)



