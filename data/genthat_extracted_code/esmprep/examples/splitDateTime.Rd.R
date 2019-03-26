library(esmprep)


### Name: splitDateTime
### Title: splitDateTime
### Aliases: splitDateTime

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute splitDateTime. Start ------------
# keyLsNew is delivered with the package. Remove the separate date
# and time for both start and end in each of the ESM datasets.
keyLsNewDT <- sapply(keyLsNew, function(x) {
     x <- x[,-match(c("start_date", "start_time",
"end_date", "end_time"), names(x))]
     return(x) } )
relEs <- relevantESVN(svyName="survey_name", IMEI="IMEI",
START_DATETIME="ES_START_DATETIME", END_DATETIME="ES_END_DATETIME")
imeiNumbers <- as.character(referenceDf$imei)
surveyNames <- c("morningTestGroup", "dayTestGroup", "eveningTestGroup",
"morningControlGroup", "dayControlGroup", "eveningControlGroup")
RELEVANT_ES <- setES(4, imeiNumbers, surveyNames, relEs)
RELEVANTINFO_ES <- RELEVANT_ES[["RELEVANTINFO_ES"]]
RELEVANTVN_ES <- RELEVANT_ES[["RELEVANTVN_ES"]]
# referenceDfNew is delivered with the package. Remove the separate
# date and time for both start and end.
referenceDfNewDT <- referenceDfNew[,-match(c("start_date", "start_time",
"end_date", "end_time"), names(referenceDfNew))]
relRef <- relevantREFVN(ID="id", IMEI="imei", ST="st",
START_DATETIME="REF_START_DATETIME", END_DATETIME="REF_END_DATETIME")
RELEVANTVN_REF <- setREF(4, relRef)
# Prerequisites in order to execute splitDateTime. End --------------
# ------------------------------------------------------
# Run function 7 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# Applying function to reference dataset (7a of 28)
referenceDfList <- splitDateTime(referenceDfNewDT, "REF", RELEVANTINFO_ES, RELEVANTVN_ES,
RELEVANTVN_REF)

# Extract reference dataset from output
referenceDfNew <- referenceDfList[["refOrEsDf"]]
names(referenceDfNew)

# Extract extended list of relevant variables names of reference dataset
RELEVANTVN_REF <- referenceDfList[["extendedVNList"]]

# Applying function to raw ESM dataset(s) (7b of 28)
# keyLs is the result of function 'genKey'.
keyList <- splitDateTime(keyLsNewDT, "ES", RELEVANTINFO_ES, RELEVANTVN_ES,
RELEVANTVN_REF)

# Extract list of raw ESM datasets from output
keyLsNew <- keyList[["refOrEsDf"]]

# Extract extended list of relevant variables names of raw ESM datasets
RELEVANTVN_ES <- keyList[["extendedVNList"]]
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



