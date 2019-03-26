library(esmprep)


### Name: missingEndDateTime
### Title: missingEndDateTime
### Aliases: missingEndDateTime

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute missingEndDateTime. Start -------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# esAssigned is a list of datasets, delivered with the package. It is
# the result of the assignment of the ESM questionnaires to ALL 8
# participants in the reference dataset.
# Prerequisites in order to execute missingEndDateTime. End ---------
# -------------------------------------------------------
# Run function 17 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# esAssigned[["ES"]] is one of the results of function 'esAssign'.
noEndDf <- missingEndDateTime(esAssigned[["ES"]], RELEVANTVN_ES)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



