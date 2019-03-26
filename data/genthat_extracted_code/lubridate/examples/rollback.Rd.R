library(lubridate)


### Name: rollback
### Title: Roll back date to last day of previous month
### Aliases: rollback

### ** Examples

date <- ymd("2010-03-03")
rollback(date)

dates <- date + months(0:2)
rollback(dates)

date <- ymd_hms("2010-03-03 12:44:22")
rollback(date)
rollback(date, roll_to_first = TRUE)
rollback(date, preserve_hms = FALSE)
rollback(date, roll_to_first = TRUE, preserve_hms = FALSE)



