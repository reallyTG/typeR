library(rebus.datetimes)


### Name: OPT_LEADING_0
### Title: Date-time regexes
### Aliases: AM_PM CENTURY CENTURY_IN DAY DAY_IN DAY_OF_YEAR DAY_OF_YEAR_IN
###   DAY_SINGLE DMY DMY_IN DTSEP DYM DYM_IN DateTime FRACTIONAL_SECOND
###   FRACTIONAL_SECOND_IN HM HMS HMS_IN HM_IN HOUR12 HOUR12_IN
###   HOUR12_SINGLE HOUR24 HOUR24_IN HOUR24_SINGLE ISO_DATE ISO_DATETIME
###   ISO_DATETIME_IN ISO_DATE_IN ISO_TIME ISO_TIME_IN MDY MDY_IN MINUTE
###   MINUTE_IN MONTH MONTH_IN MS MS_IN MYD MYD_IN OPT_LEADING_0 SECOND
###   SECOND_IN TIMEZONE TIMEZONE_OFFSET WEEKDAY0 WEEKDAY1 WEEK_OF_YEAR
###   WEEK_OF_YEAR_IN YDM YDM_IN YEAR YEAR2 YEAR4 YMD YMD_IN datetime
### Keywords: datasets

### ** Examples

datetime("%m/%d/%Y")             # match US style dates
twelve_or_twentyfour <- rebus.base::or("%H", "%I%p")
datetime(twelve_or_twentyfour) # match hours in 24h or 12h format

## Not run: 
##D # week days and months can be matched in any locale
##D if(.Platform$OS.type == "windows")
##D {
##D   fr_FR <- "French_France"
##D   ar_QA <- "Arabic_Qatar"
##D } else if(Sys.info()["sysname"] != "Darwin") # mac
##D {
##D   fr_FR <- "fr_FR"
##D   ar_QA <- "ar_QA"
##D } else if(Sys.info()["sysname"] != "Linux")
##D {
##D   fr_FR <- "fr_FR.utf8"
##D   ar_QA <- "ar_QA.utf8"
##D }
##D datetime("%a %A %b %B", fr_FR)
##D datetime("%a %A %b %B", ar_QA)
##D 
##D # All letter tokens.  Lots of output.
##D x <- paste0("%", c(letters, LETTERS))
##D stats::setNames(datetime(x), x)
## End(Not run)

# Individual date-time components
DTSEP             # optional selected punctuation or space
CENTURY           # exactly two digits
YEAR              # one to four digits
YEAR2             # exactly two digits
YEAR4             # exactly four digits
MONTH             # number from 1 to 12, leading zero
WEEK_OF_YEAR      # number from 0 to 53, leading zero
DAY               # number from 1 to 31, leading zero
DAY_SINGLE        # leading space
HOUR24            # 24 hour clock, leading zero
HOUR12            # 12 hour clock, leading zero
HOUR24_SINGLE     # 24 hour clock, leading space
HOUR12_SINGLE     # 12 hour clock, leading space
MINUTE            # number from 0 to 59, leading zero
SECOND            # number from 0 to 61 (leap seconds), leading zero
FRACTIONAL_SECOND # a second optional decimal point and up to 6 digits
AM_PM             # AM or PM, any case
TIMEZONE_OFFSET   # optional plus or minus, then four digits
TIMEZONE          # Any value returned by OlsonNames()
# ISO 8601 formats
ISO_DATE          # %Y-%m-%d
ISO_TIME          # %H:%M:%S
ISO_DATETIME      # ISO_DATE followed by ISO_TIME, separated by space or "T".
# Compound forms, separated by DTSEP
YMD
YDM
MYD
MDY
DYM
DMY
HMS
HM
MS

# Some forms have less strict alternatives for input (with an '_IN' suffix).
CENTURY_IN
MONTH_IN
WEEK_OF_YEAR_IN
DAY_IN
HOUR24_IN
HOUR12_IN
MINUTE_IN
SECOND_IN
FRACTIONAL_SECOND_IN
ISO_DATE_IN
ISO_TIME_IN
ISO_DATETIME_IN
YMD_IN
YDM_IN
MYD_IN
MDY_IN
DYM_IN
DMY_IN
HMS_IN
HM_IN
MS_IN

dates <- seq(as.Date("2000-01-01"), as.Date("2001-01-01"), "1 day")
datetimes <- seq(as.POSIXct(Sys.Date()), as.POSIXct(Sys.Date() + 1), "1 sec")
times <- substring(datetimes, 12, 19)
stopifnot(
  all(grepl(ISO_DATE, dates)),
  all(grepl(ISO_TIME, times)),
  all(grepl(ISO_DATETIME, datetimes))
)
non_dates <- c(
  "2000-13-01", "2000-01-32", "2000-00-01", "2000-01-00"
)
non_times <- c(
  "24:00:00", "23:60:59", "23:59:62", "23 59 59"
)
stopifnot(
  all(!grepl(ISO_DATE, non_dates)),
  all(!grepl(ISO_TIME, non_times))
)



