library(esmprep)


### Name: relevantREFVN
### Title: relevantREFVN
### Aliases: relevantREFVN

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# ------------------------------------------------------
# Run function 1 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# With date and time as separate arguments
relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
# With date-time objects instead of separate date and time
relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
START_DATETIME="start_dateTime", END_DATETIME="end_dateTime")
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



