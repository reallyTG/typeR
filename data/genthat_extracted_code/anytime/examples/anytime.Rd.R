library(anytime)


### Name: anytime
### Title: Parse POSIXct or Date objects from input data
### Aliases: anytime anydate utctime utcdate

### ** Examples

## See the source code for a full list of formats, and the
## or the reference in help('anytime-package') for details
times <- c("2004-03-21 12:45:33.123456",
          "2004/03/21 12:45:33.123456",
          "20040321 124533.123456",
          "03/21/2004 12:45:33.123456",
          "03-21-2004 12:45:33.123456",
          "2004-03-21",
          "20040321",
          "03/21/2004",
          "03-21-2004",
          "20010101")
anytime(times)
anydate(times)
utctime(times)
utcdate(times)

## show effect of tz argument
anytime("2001-02-03 04:05:06")
## adjust parsed time to given TZ argument
anytime("2001-02-03 04:05:06", tz="America/Los_Angeles")
## somewhat equvalent base R functionality
format(anytime("2001-02-03 04:05:06"), tz="America/Los_Angeles")



