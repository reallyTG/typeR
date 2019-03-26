library(season)


### Name: indoor
### Title: Indoor Temperature Data
### Aliases: indoor
### Keywords: datasets

### ** Examples

data(indoor)
res = cosinor(bedroom~1, date='datetime', type='hourly', data=indoor)
summary(res)



