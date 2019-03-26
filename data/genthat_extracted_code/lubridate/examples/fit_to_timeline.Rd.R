library(lubridate)


### Name: fit_to_timeline
### Title: Fit a POSIXlt date-time to the timeline
### Aliases: fit_to_timeline

### ** Examples

## Not run: 
##D 
##D tricky <- structure(list(sec   = c(5,    0,    0,    -1),
##D                          min   = c(0L,   5L,   5L,   0L),
##D                          hour  = c(2L,   0L,   2L,   2L),
##D                          mday  = c(4L,   4L,   14L,  4L),
##D                          mon   = c(10L,  10L,  2L,   10L),
##D                          year  = c(112L, 112L, 110L, 112L),
##D                          wday  = c(0L,   0L,   0L,   0L),
##D                          yday  = c(308L, 308L, 72L,  308L),
##D                          isdst = c(1L,   0L,   0L,   1L)),
##D                     .Names = c("sec", "min", "hour", "mday", "mon",
##D                                "year", "wday", "yday",  "isdst"),
##D                     class = c("POSIXlt", "POSIXt"),
##D                     tzone = c("America/Chicago", "CST", "CDT"))
##D 
##D tricky
##D ## [1] "2012-11-04 02:00:00 CDT" Doesn't exist because clocks "fall back" to 1:00 CST
##D ## [2] "2012-11-04 00:05:00 CST" Times are still CDT, not CST at this instant
##D ## [3] "2010-03-14 02:00:00 CDT" DST gap
##D ## [4] "2012-11-04 01:59:59 CDT" Does exist, but has deceptive internal structure
##D 
##D fit_to_timeline(tricky)
##D ## Returns:
##D ## [1] "2012-11-04 02:00:00 CST" instant paired with correct tz & DST combination
##D ## [2] "2012-11-04 00:05:00 CDT" instant paired with correct tz & DST combination
##D ## [3] NA - fake time changed to NA (compare to as.POSIXct(tricky))
##D ## [4] "2012-11-04 01:59:59 CDT" -real instant, left as is
##D 
##D fit_to_timeline(tricky, simple = TRUE)
##D ## Returns valid time-dates by extrapolating CDT and CST zones:
##D ## [1] "2012-11-04 01:00:05 CST" "2012-11-04 01:05:00 CDT"
##D ## [3] "2010-03-14 03:05:00 CDT" "2012-11-04 01:59:59 CDT"
## End(Not run)



