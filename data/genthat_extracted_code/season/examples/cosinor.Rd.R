library(season)


### Name: cosinor
### Title: Cosinor Regression Model for Detecting Seasonality in Yearly
###   Data or Circadian Patterns in Hourly Data
### Aliases: cosinor

### ** Examples

## cardiovascular disease data (offset based on number of days in...
## ...the month scaled to an average month length)
data(CVD)
res = cosinor(cvd~1, date='month', data=CVD, type='monthly',
              family=poisson(), offsetmonth=TRUE)
summary(res)
seasrescheck(res$residuals) # check the residuals
# stillbirth data
data(stillbirth)
res = cosinor(stillborn~1, date='dob', data=stillbirth,
              family=binomial(link='cloglog'))
summary(res)
plot(res)
# hourly indoor temperature data
res = cosinor(bedroom~1, date='datetime', type='hourly', data=indoor)
summary(res)



