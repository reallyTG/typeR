library(fmdates)


### Name: adjust
### Title: Adjust to good dates
### Aliases: adjust

### ** Examples

ausy <- AUSYCalendar()
adjust(lubridate::ymd("20120102"), "u", ausy)
adjust(lubridate::ymd("20120102"), "f", ausy)
adjust(lubridate::ymd("20120102"), "mf", ausy)
adjust(lubridate::ymd("20120102"), "p", ausy)
adjust(lubridate::ymd("20120102"), "mp", ausy)
adjust(lubridate::ymd("20120102"), "ms", ausy)



