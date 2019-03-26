library(esmprep)


### Name: esList
### Title: esList
### Aliases: esList

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute esList. Start --------------------
# Generate argument RELEVANTVN_ES
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
imeiNumbers <- as.character(referenceDf$imei)
surveyNames <- c("morningTestGroup", "dayTestGroup", "eveningTestGroup",
"morningControlGroup", "dayControlGroup", "eveningControlGroup")
RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]
# Prerequisites in order to execute esList. End ----------------------
# ------------------------------------------------------
# Run function 5 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# 6 exemplary raw ESM (sub-)datasets.
esLs <- esList(list(morningControl, dayControl, eveningControl,
morningTest, dayTest, eveningTest), RELEVANTVN_ES)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



