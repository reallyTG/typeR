
## simple tests, to be replaced "eventually" by something better using RUnit

if (requireNamespace("RcppQuantuccia", quietly=TRUE)) {

    library(RcppQuantuccia)

    setCalendar("UnitedStates::NYSE")   # use / or :: to separate instance from country calendar

    dates <- as.Date("2017-01-03") + 0:3  # four weekdays, so adjustments give same dates
    stopifnot(adjust(dates) == dates,
              adjust(dates, bdc="Following") == dates,
              adjust(dates, bdc="ModifiedFollowing") == dates,
              adjust(dates, bdc="Preceding") == dates,
              adjust(dates, bdc="ModifiedPreceding") == dates,
              adjust(dates, bdc="Unadjusted") == dates,
              adjust(dates, bdc="HalfMonthModifiedFollowing") == dates,
              adjust(dates, bdc="Nearest") == dates,
              adjust(dates, bdc="Unadjusted") == dates)

    date <- as.Date("2017-01-01")   	# New Year's -- now expect differences
    stopifnot(adjust(date) != date,
              adjust(date, bdc="Following") != date,
              adjust(date, bdc="ModifiedFollowing") != date,
              adjust(date, bdc="Preceding") != date,
              adjust(date, bdc="ModifiedPreceding") != date,
              adjust(date, bdc="Unadjusted") == date,  ## NB: unaltered by design
              adjust(date, bdc="HalfMonthModifiedFollowing") != date,
              adjust(date, bdc="Nearest") != date)

    date <- as.Date("2017-01-03")  		# workday
    stopifnot(advanceDate(date, 0) == date,
              advanceDate(date, 1) == date + 1)

    dates <- as.Date("2017-01-03") + 0:2  		# workday
    stopifnot(advanceUnits(dates, 0, "Days") == dates,
              advanceUnits(dates, 1, "Days") == dates + 1)

    date <- as.Date("2017-01-03")  		# workday
    stopifnot(businessDaysBetween(date, date + 7) == 5)

    stopifnot(getEndOfMonth(date) == as.Date("2017-01-31"))




    ## testing New York Stock Exchange Holidays, cf quantlib/test-suite/calendars.cpp
    setCalendar("UnitedStates::NYSE")
    expected2004 <- as.Date(c("2004-01-01", "2004-01-19", "2004-02-16", "2004-04-09", "2004-05-31",
                              "2004-06-11", "2004-07-05", "2004-09-06", "2004-11-25", "2004-12-24"))
    stopifnot(getHolidays(as.Date("2004-01-01"), as.Date("2004-12-31")) == expected2004)

    expected2005 <- as.Date(c("2005-01-17", "2005-02-21", "2005-03-25", "2005-05-30",
                              "2005-07-04", "2005-09-05", "2005-11-24", "2005-12-26"))
    stopifnot(getHolidays(as.Date("2005-01-01"), as.Date("2005-12-31")) == expected2005)

    expected2006 <- as.Date(c("2006-01-02", "2006-01-16", "2006-02-20", "2006-04-14", "2006-05-29",
                              "2006-07-04", "2006-09-04", "2006-11-23", "2006-12-25"))
    stopifnot(getHolidays(as.Date("2006-01-01"), as.Date("2006-12-31")) == expected2006)

    historicalHolidays <- as.Date(c(
        "2012-10-29", "2012-10-30",     						# Hurricane Sandy
        "2004-06-11",											# Reagan's funeral
        "2001-09-11", "2001-09-12", "2001-09-13", "2001-09-14", # September 11, 2001
        "1994-04-27",											# Nixon's funeral
        "1985-09-27",											# Hurricane Gloria
        "1977-07-14"                                            # 1997 Blackout
        ## and more dates more omitted here
    ))
    stopifnot( ! isBusinessDay(historicalHolidays) )
}
