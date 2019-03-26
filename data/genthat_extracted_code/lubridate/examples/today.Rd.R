library(lubridate)


### Name: today
### Title: The current date
### Aliases: today
### Keywords: chron utilities

### ** Examples

today()
today("GMT")
today() == today("GMT") # not always true
today() < as.Date("2999-01-01") # TRUE  (so far)



