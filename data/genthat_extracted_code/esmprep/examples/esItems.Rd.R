library(esmprep)


### Name: esItems
### Title: esItems
### Aliases: esItems

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute esItems. Start ------------------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# keyLsNew is a list of datasets, also delivered with the package
rmInvLs <- rmInvalid(keyLsNew, RELEVANTVN_ES)
# Prerequisites in order to execute esItems. End --------------------
# -------------------------------------------------------
# Run function 10 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Extract the item names of the raw ESM datasets. rmInvLs[["dfValid"]]
# is one of the results from function 'rmInvalid'
plausibItems <- esItems(dfList=rmInvLs[["dfValid"]], RELEVANTVN_ES)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



