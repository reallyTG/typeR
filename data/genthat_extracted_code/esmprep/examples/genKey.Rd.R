library(esmprep)


### Name: genKey
### Title: genKey
### Aliases: genKey

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute genKey. Start -------------------
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
imeiNumbers <- as.character(referenceDf$imei)
surveyNames <- c("morningTestGroup", "dayTestGroup", "eveningTestGroup",
"morningControlGroup", "dayControlGroup", "eveningControlGroup")
RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]
esLs <- esList(list(morningControl, dayControl, eveningControl,
morningTest, dayTest, eveningTest), RELEVANTVN_ES)
# Prerequisites in order to execute genKey. End ---------------------
# ------------------------------------------------------
# Run function 6 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# esLs is the result of function 'esList'.
keyLs <- genKey(esLs)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



