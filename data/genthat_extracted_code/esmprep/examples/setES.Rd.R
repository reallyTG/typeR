library(esmprep)


### Name: setES
### Title: setES
### Aliases: setES

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute setES. Start --------------------
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
# Prerequisites in order to execute setES. End ----------------------
# ------------------------------------------------------
# Run function 4 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# imeiNumbers is the vector containing all IMEI numbers used in
# the ESM study; use the respective entries in the referenceDf.
imeiNumbers <- as.character(referenceDf$imei)
# surveyNames is the vector containing all ESM version names.
surveyNames <- c(
# Test group
   "morningTestGroup", "dayTestGroup", "eveningTestGroup",
# Control group
   "morningControlGroup", "dayControlGroup", "eveningControlGroup")
# 4 is the number of daily prompts
# relEs is the result of function 'relevantESVN'
RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
# Extract relevant ESM general information
RELEVANTINFO_ES <- RELEVANT_ES[["RELEVANTINFO_ES"]]
# Extract list of relevant variables names of raw ESM datasets.
RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]

# With date-time objects instead of separate date and time
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
START_DATETIME="start_dateTime", END_DATETIME="end_dateTime")
RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
# Extract relevant ESM general information
RELEVANTINFO_ES <- RELEVANT_ES[["RELEVANTINFO_ES"]]
# Extract list of relevant variables names of raw ESM datasets.
RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



