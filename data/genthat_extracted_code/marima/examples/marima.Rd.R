library(marima)


### Name: marima
### Title: marima
### Aliases: marima

### ** Examples

# Example 1:
library(marima)
# Generate a 4-variate time series (in this example):
#
kvar<-4 ; set.seed(4711)
y4<-matrix(round(100*rnorm(4*1000, mean=2.0)), nrow=kvar)
# If wanted define differencing of variable 4 (lag=1)
# and variable 3 (lag=6), for example:
y4.dif<-define.dif(y4, difference=c(4, 1, 3, 6))
# The differenced series will be in y4.dif$y.dif, the observations
# lost by differencing being excluded.
#
y4.dif.analysis<-y4.dif$y.dif
# Give lags the be included in ar- and ma-parts of model:
#
ar<-c(1, 2, 4)
ma<-c(1)
# Define the multivariate arma model using 'define.model' procedure.
# Output from 'define.model' will be the patterns of the ar- and ma-
# parts of the model specified.
#
Mod <- define.model(kvar=4, ar=ar, ma=ma, reg.var=3)
arp<-Mod$ar.pattern
map<-Mod$ma.pattern
# Print out model in 'short form':
#
short.form(arp)
short.form(map)
# Now call marima:
Model <- marima(y4.dif.analysis, ar.pattern=arp, ma.pattern=map, 
                penalty=0.0)
# The estimated model is in the object 'Model':
#
ar.model<-Model$ar.estimates
ma.model<-Model$ma.estimates
dif.poly<-y4.dif$dif.poly  # = difference polynomial in ar-form.
# Multiply the estimated ar-polynomial with difference polynomial
# to compute the aggregated ar-part of the arma model:
#
ar.aggregated <- pol.mul(ar.model, dif.poly, L=12)
# and print everything out in 'short form':
#
short.form(ar.aggregated, leading=FALSE)
short.form(ma.model, leading=FALSE)




