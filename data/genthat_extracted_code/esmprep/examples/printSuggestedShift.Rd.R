library(esmprep)


### Name: printSuggestedShift
### Title: printSuggestedShift
### Aliases: printSuggestedShift

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute printSuggestedShift. Start ------
# Use example list delivered with the package
RELEVANTINFO_ES <- RELEVANTINFO_ES
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# esAssigned is a list of datasets, delivered with the package. It is
# the result of the assignment of the ESM questionnaires to ALL 8
# participants in the reference dataset.
noEndDf <- missingEndDateTime(esAssigned[["ES"]], RELEVANTVN_ES)
identDf <- esIdentical(noEndDf, RELEVANTVN_ES)
sugShift <- suggestShift(identDf, 100, RELEVANTINFO_ES, RELEVANTVN_ES)
# Prerequisites in order to execute printSuggestedShift. End --------
# -------------------------------------------------------
# Run function 20 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Display the result of function 'suggestShift' in the console.
printSuggestedShift(sugShift, RELEVANTVN_ES)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



