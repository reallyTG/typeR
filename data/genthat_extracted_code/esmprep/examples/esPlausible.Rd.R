library(esmprep)


### Name: esPlausible
### Title: esPlausible
### Aliases: esPlausible

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute esPlausible. Start --------------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# keyLsNew is a list of datasets, also delivered with the package
rmInvLs <- rmInvalid(keyLsNew, RELEVANTVN_ES)
plausibItems <- esItems(dfList=rmInvLs[["dfValid"]], RELEVANTVN_ES)
# Prerequisites in order to execute esPlausible. End ----------------
# -------------------------------------------------------
# Run function 11 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Help checking the plausibility of items in the raw ESM datasets. rmInvLs[["dfValid"]]
# is one of the results from function 'rmInvalid'.
# plausibItems is the result of function 'esItems'.
plausibLs <- esPlausible(dfList=rmInvLs[["dfValid"]], itemVecList=plausibItems)
# Display the results (4 data frames) to the console
# plausibNames gives an overview of the item names across all ESM versions
plausibLs[["plausibNames"]]
# plausibClass gives an overview of the variable types of all items
plausibLs[["plausibClass"]]
# plausibRowNa shows for each ESM version the number of lines in the raw
# ESM datasets and how much percent of the data is missing (NAs).
plausibLs[["plausibRowNa"]]
# plausibMinMax shows for each numeric variable the minimum and maximum.
plausibLs[["plausibMinMax"]]
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



