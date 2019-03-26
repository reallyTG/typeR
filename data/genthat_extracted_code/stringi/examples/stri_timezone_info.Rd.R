library(stringi)


### Name: stri_timezone_info
### Title: Query a Given Time Zone
### Aliases: stri_timezone_info

### ** Examples

stri_timezone_info()
stri_timezone_info(locale="sk_SK")
sapply(c("short", "long", "generic_short", "generic_long",
         "gmt_short", "gmt_long", "common", "generic_location"),
  function(e) stri_timezone_info("Europe/London", display_type=e))




