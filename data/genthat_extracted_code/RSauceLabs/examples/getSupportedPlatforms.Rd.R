library(RSauceLabs)


### Name: getSupportedPlatforms
### Title: Get Supported Platforms
### Aliases: getSupportedPlatforms

### ** Examples

## Not run: 
##D myAcc <- account()
##D getSauceLabsStatus(myAcc)
##D #$wait_time
##D #[1] 1580.536
##D #
##D #$service_operational
##D #[1] TRUE
##D #
##D #$status_message
##D #[1] "Basic service status checks passed."
##D supportedPlatforms <- getSupportedPlatforms(myAcc)
##D supportedPlatforms[os == "Linux" & api_name == "chrome" & short_version > 44
##D                    , .(api_name, long_version)]
##D #api_name  long_version
##D #1:   chrome 45.0.2454.85.
##D #2:   chrome  46.0.2490.71
##D #3:   chrome  47.0.2526.73
##D #4:   chrome  48.0.2564.97
##D getAppiumEolDates(myAcc)
##D #$`1.4.0`
##D #[1] "2016-04-09 PDT"
##D #
##D #$`1.4.3`
##D #[1] "2016-04-09 PDT"
##D #....
## End(Not run)



