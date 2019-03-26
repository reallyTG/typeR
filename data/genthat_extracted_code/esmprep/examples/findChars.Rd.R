library(esmprep)


### Name: findChars
### Title: findChars
### Aliases: findChars

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute findChars. Start ----------------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# isCompleteLs is a list of datasets, also delivered with the package
esMerged <- esMerge(isCompleteLs, RELEVANTVN_ES)
esMerged[,RELEVANTVN_ES[["ES_IMEI"]]] <- as.character(esMerged[,RELEVANTVN_ES[["ES_IMEI"]]])
# Prerequisites in order to execute findChars. End ------------------
# -------------------------------------------------------
# Run function 14 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# esMerged is the result of function 'esMerge'
findTextIdx <- findChars(esMerged)
# Display structure of function output
str(findTextIdx)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



