library(esmprep)


### Name: expectedPromptIndex
### Title: expectedPromptIndex
### Aliases: expectedPromptIndex

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute makeShift. Start ----------------
# Use example list delivered with the package
RELEVANTINFO_ES <- RELEVANTINFO_ES
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# Use example list delivered with the package
RELEVANTVN_REF <- RELEVANTVN_REFext
# esAssigned is a list of datasets, delivered with the package. It is
# the result of the assignment of the ESM questionnaires to ALL 8
# participants in the reference dataset.
noEndDf <- missingEndDateTime(esAssigned[["ES"]], RELEVANTVN_ES)
identDf <- esIdentical(noEndDf, RELEVANTVN_ES)
sugShift <- suggestShift(identDf, 100, RELEVANTINFO_ES, RELEVANTVN_ES)
keyPromptDf <- sugShift$suggestShiftDf[,c("NEW_PROMPT", "SHIFTKEY")]
madeShift <- makeShift(sugShift, referenceDfNew, keyPromptDf, RELEVANTINFO_ES, RELEVANTVN_REF)
# Prerequisites in order to execute makeShift. End -------------------
# -------------------------------------------------------
# Run function 22 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Generate second argument of function 'expectedPromptIndex'. It's strongly
# recommended to read the explanation of this 2nd argument in the esmprep
# vignette, function 'expectedPromptIndex'.
expIdxList <- list(
# I - the user - expect in the ESM version morningTestGroup that
# prompt no.1 is always linked to the value 1.
list("morningTestGroup", 1, 1),
# I - the user - expect in the ESM version dayTestGroup that
# prompt no. 2 and no.3 are always linked to the value 2.
list("dayTestGroup", c(2, 3), 2),
# Information of all further ESM versions are passed accordingly:
list("eveningTestGroup", 4, 3),
list("morningControlGroup", 1, 1),
list("dayControlGroup", c(2,3), 2),
list("eveningControlGroup", 4, 3))
# madeShiftDf$esDf is part of the output of function 'makeShift', if at
# least one questionnaire was shifted to a neighboring prompt index.
expectedDf <- expectedPromptIndex(madeShift$esDf, expIdxList, RELEVANTINFO_ES,
RELEVANTVN_ES)
# If no questionnaire is suggested for shifting (see function suggestShift)
# simply use the result of function suggestShift as 1st argument.
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



