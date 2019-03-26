library(vcr)


### Name: lightswitch
### Title: Turn vcr on and off, check on/off status, and turn off for a
###   given http call
### Aliases: lightswitch turned_off turn_on turned_on turn_off

### ** Examples

## Not run: 
##D vcr_configure(dir = tempdir())
##D 
##D turn_on()
##D turned_on()
##D turn_off()
##D 
##D # turn off for duration of a block
##D library(crul)
##D turned_off({
##D  res <- HttpClient$new(url = "https://eu.httpbin.org/get")$get()
##D })
##D res
##D 
##D # turn completely off
##D turn_off()
##D library(webmockr)
##D crul::mock()
##D # HttpClient$new(url = "https://eu.httpbin.org/get")$get(verbose = TRUE)
##D turn_on()
## End(Not run)



