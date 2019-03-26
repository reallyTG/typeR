library(esmprep)


### Name: genDateTime
### Title: genDateTime
### Aliases: genDateTime

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute genDateTime. Start --------------
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
imeiNumbers <- as.character(referenceDf$imei)
surveyNames <- c("morningTestGroup", "dayTestGroup", "eveningTestGroup",
"morningControlGroup", "dayControlGroup", "eveningControlGroup")
RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
RELEVANTINFO_ES <- RELEVANT_ES[["RELEVANTINFO_ES"]]
RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]
esLs <- esList(list(morningControl, dayControl, eveningControl,
morningTest, dayTest, eveningTest), RELEVANTVN_ES)
keyLs <- genKey(esLs)
relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
STARTDATE="start_date", STARTTIME="start_time",
ENDDATE="end_date", ENDTIME="end_time")
RELEVANTVN_REF <- setREF(4, relRef)
# Prerequisites in order to execute genDateTime. End ----------------
# ------------------------------------------------------
# Run function 7 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# Applying function to reference dataset (7a of 28)
referenceDfList <- genDateTime(referenceDf, "REF", RELEVANTINFO_ES, RELEVANTVN_ES,
RELEVANTVN_REF)

# Extract reference dataset from output
referenceDfNew <- referenceDfList[["refOrEsDf"]]

# Extract extended list of relevant variables names of reference dataset
RELEVANTVN_REF <- referenceDfList[["extendedVNList"]]

# Applying function to raw ESM dataset(s) (7b of 28)
# keyLs is the result of function 'genKey'.
keyList <- genDateTime(keyLs, "ES", RELEVANTINFO_ES, RELEVANTVN_ES,
RELEVANTVN_REF)

# Extract list of raw ESM datasets from output
keyLsNew <- keyList[["refOrEsDf"]]

# Extract extended list of relevant variables names of raw ESM datasets
RELEVANTVN_ES <- keyList[["extendedVNList"]]
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



