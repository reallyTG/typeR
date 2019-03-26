library(promote)


### Name: promote.predict_raw
### Title: Calls promote's REST API and returns a JSON document containing
###   both the prediction and associated metadata.
### Aliases: promote.predict_raw

### ** Examples

promote.config <- c(
 username = "your username",
 apikey = "your apikey",
 env="http://ip_of_alteryx_promote.com"
)
## Not run: 
##D promote.predict_raw("irisModel", iris)
## End(Not run)



