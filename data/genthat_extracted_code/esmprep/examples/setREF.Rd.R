library(esmprep)


### Name: setREF
### Title: setREF
### Aliases: setREF

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute setREF. Start  ------------------
relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
# Prerequisites in order to execute setREF. End ---------------------
# ------------------------------------------------------
# Run function 2 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# 4 is the number of daily prompts.
# relRef is the result of function 'relevantREFVN'
# Relevant variables names of reference dataset.
(RELEVANTVN_REF <- setREF(4, relRef))
# With date-time objects instead of separate date and time
relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
START_DATETIME="start_dateTime", END_DATETIME="end_dateTime")
(RELEVANTVN_REF <- setREF(4, relRef))
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



