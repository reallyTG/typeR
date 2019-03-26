library(dynia)


### Name: casualties
### Title: Casualities time series with covariate
### Aliases: casualties
### Keywords: datasets

### ** Examples

data(casualties)
plot(casualties)
abline(v=c(2007,10), col="red")

###Intervention based on Casualties Data###
fitdi(z=casualties[,1],T=70,xint=scale(casualties[,2]),order=c(1,0,0),
 seasonal=list(order=c(0,0,1),period=12))



