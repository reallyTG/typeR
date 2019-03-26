library(esmprep)


### Name: convertChars
### Title: convertChars
### Aliases: convertChars

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute convertChars. Start -------------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# isCompleteLs is a list of datasets, also delivered with the package
esMerged <- esMerge(isCompleteLs, RELEVANTVN_ES)
esMerged[,RELEVANTVN_ES[["ES_IMEI"]]] <- as.character(esMerged[,RELEVANTVN_ES[["ES_IMEI"]]])
findTextIdx <- findChars(esMerged)
# Prerequisites in order to execute convertChars. End ---------------
# -------------------------------------------------------
# Run function 15 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# From result of function 'findChars' select the indices of the items
# in the ESM dataset that contain text answers of the participants.
findTextIdx1 <- findTextIdx[c(1,2,9,10)]
# Use findTextIdx1 to generate the 3rd argument of function 'convertChars'.
textColumns <- names(findTextIdx1)
# Generate data.frame specifying the conversion of single characters.
convertCharsDf <- data.frame(c("ä", "ü"), c("ae", "ue"))
# Apply function. esMerged is the result of function 'esMerge'.
esMerged1 <- convertChars(esMerged, textColumns, convertCharsDf)
# # As default upper and lower case are NOT ignored! If you want them
# # ignored, additionally pass TRUE to the argument ignoreCase, like this:
# convertChars(esMerged, textColumns, convertCharsDf, ignoreCase=TRUE)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



