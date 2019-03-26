library(touchard)


### Name: toureg
### Title: Touchard Regression
### Aliases: toureg gleverage cooks.distance hatvalues predict
###   predict.toureg plot.toureg

### ** Examples


### Horseshoe crab data used by several textbook sources	  
data(Crabs)

### Model Fitting and Plotting
summary( fm <- toureg(y ~ weight + color, data=Crabs) )

plot(fm)
plot(fm , which = 1)
rgram(fm)

### Diagnostics
plot(hatvalues(fm))
plot(gleverage(fm))
plot(cooks.distance(fm))

### Predicted values for 'newdata' ###
 
# The default _type="invlink"_  is on the scale of the inverse link, i.e. \hat{lambda}=exp(x*beta); 
predict(fm, newdata=data.frame(weight=c(5,6), color=c(2,4)), se.fit=TRUE)
# the alternative "response" is on the scale of the response variable, i.e. \hat{mu}, 
# which is a function of \hat{lambda} and \hat{delta};
predict(fm, newdata=data.frame(weight=c(5,6), color=c(2,4)), type="response", se.fit=TRUE)
# and finally the alternative "variance" yields predicted variances, i.e. \hat{sigma}^2,  
# which is a function of \hat{lambda} and \hat{delta} and for which SEs are not available so far.
predict(fm, newdata=data.frame(weight=c(5,6), color=c(2,4)), type="variance")





