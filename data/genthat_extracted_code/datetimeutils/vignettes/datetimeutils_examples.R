### R code from vignette source 'datetimeutils_examples.Rnw'

###################################################
### code chunk number 1: datetimeutils_examples.Rnw:25-27
###################################################
options(continue = "  ", digits = 3, width = 70, useFancyQuotes = FALSE)
require("datetimeutils")


###################################################
### code chunk number 2: datetimeutils_examples.Rnw:45-47
###################################################
convert_date(40000, "excel")
convert_date(725935, "matlab")


###################################################
### code chunk number 3: datetimeutils_examples.Rnw:53-54
###################################################
convert_tz("2016-05-10 12:00:00", "Europe/Berlin", "America/Chicago")


###################################################
### code chunk number 4: datetimeutils_examples.Rnw:60-63
###################################################
is_weekend(as.Date("2017-1-5"))
next_businessday(as.Date("2017-1-5"))   ## there is also 'previous_businessday'
next_businessday(as.Date("2017-1-5"), shift = 2)  ## short-hand: 'next_bday'


###################################################
### code chunk number 5: datetimeutils_examples.Rnw:68-72
###################################################
s <- c(" 1999-08-19 10:00",  
       "19.8.1999 10:00",    ## Central-European, e.g. Germany
       "8/19/99 10:00:00")   ## US
guess_datetime(s)


###################################################
### code chunk number 6: datetimeutils_examples.Rnw:78-83
###################################################
last_weekday(5, as.Date("2017-1-1"))   ## last Friday of Jan 2017
nth_weekday(1, as.Date("2017-1-1"), 2) ## second Monday of Jan 2017

dates <- seq(as.Date("2012-1-1"), as.Date("2013-4-15"), by = "day")
nth_day(dates, period = "quarter", n = "first")


###################################################
### code chunk number 7: datetimeutils_examples.Rnw:86-87
###################################################
toLatex(sessionInfo())


