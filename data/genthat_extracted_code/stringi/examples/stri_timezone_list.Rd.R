library(stringi)


### Name: stri_timezone_list
### Title: List Available Time Zone Identifiers
### Aliases: stri_timezone_list

### ** Examples

stri_timezone_list()
stri_timezone_list(offset=1)
stri_timezone_list(offset=5.5)
stri_timezone_list(offset=5.75)
stri_timezone_list(region="PL")
stri_timezone_list(region="US", offset=-10)

# Fetch info on all time zones
do.call(rbind.data.frame,
   lapply(stri_timezone_list(), function(tz) stri_timezone_info(tz)))




