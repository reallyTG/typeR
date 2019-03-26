library(seasonal)


### Name: predict.seas
### Title: Seasonal Adjusted Series
### Aliases: predict.seas

### ** Examples

## Not run: 
##D # Using data from Dec. 59 to estimate a model
##D ap.short <- window(AirPassengers, end = c(1959, 12))
##D m <- seas(ap.short)
##D predict(m)
##D final(m)     # equivalent
##D 
##D # Use Dec. 59 model specification to estimate data up to Dec. 60
##D predict(m, AirPassengers)
## End(Not run)



