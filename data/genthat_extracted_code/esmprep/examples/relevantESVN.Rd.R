library(esmprep)


### Name: relevantESVN
### Title: relevantESVN
### Aliases: relevantESVN

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# ------------------------------------------------------
# Run function 3 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# With date and time as separate arguments
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
# With date-time objects instead of separate date and time
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
START_DATETIME="start_dateTime", END_DATETIME="end_dateTime")
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



