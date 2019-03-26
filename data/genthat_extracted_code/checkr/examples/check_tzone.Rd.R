library(checkr)


### Name: check_tzone
### Title: Check TimeZone
### Aliases: check_tzone check_tz

### ** Examples

check_tzone(Sys.Date(), error = FALSE)
x <- as.POSIXct("2000-01-02 03:04:55", tz = "Etc/GMT+8")
check_tzone(x, tzone = "PST8PDT", error = FALSE)



