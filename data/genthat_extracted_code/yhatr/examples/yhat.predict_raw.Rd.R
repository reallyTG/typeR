library(yhatr)


### Name: yhat.predict_raw
### Title: Calls Yhat's REST API and returns a JSON document containing
###   both the prediction and associated metadata.
### Aliases: yhat.predict_raw

### ** Examples

yhat.config <- c(
 username = "your username",
 apikey = "your apikey"
)
## Not run: 
##D yhat.predict_raw("irisModel", iris)
## End(Not run)



