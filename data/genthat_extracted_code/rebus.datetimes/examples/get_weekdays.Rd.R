library(rebus.datetimes)


### Name: get_weekdays
### Title: Get the days of the week
### Aliases: get_months get_weekdays

### ** Examples

get_weekdays()
get_weekdays(TRUE)
get_months()
get_months(TRUE)
## Not run: 
##D if(.Platform$OS.type == "windows")
##D {
##D   get_weekdays(locale = "French_France")
##D   get_weekdays(TRUE, locale = "French_France")
##D   get_weekdays(locale = "Arabic_Qatar")
##D   get_weekdays(TRUE, locale = "Arabic_Qatar")
##D } else
##D {
##D   get_weekdays(locale = "fr_FR.utf8")
##D   get_weekdays(TRUE, locale = "fr_FR.utf8")
##D   get_weekdays(locale = "ar_QA.utf8")
##D   get_weekdays(TRUE, locale = "ar_QA.utf8")
##D }
## End(Not run)



