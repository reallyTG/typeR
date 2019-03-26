library(esmprep)


### Name: printRmInvalid
### Title: printRmInvalid
### Aliases: printRmInvalid

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute printRmInvalid. Start -----------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# keyLsNew is a list of datasets, also delivered with the package
rmInvLs <- rmInvalid(keyLsNew, RELEVANTVN_ES)
# Prerequisites in order to execute printRmInvalid. End -------------
# ------------------------------------------------------
# Run function 9 of 28; see esmprep functions' hierarchy.
# ------------------------------------------------------
# rmInvLs is the result of function 'rmInvalid'. Display its result
# in the console both tablulated and in detail.
key_rmLs <- printRmInvalid(rmInvLs, smr="both", RELEVANTVN_ES)
# Display the list containing the KEY values of all questionnaires
# that have been removed.
key_rmLs
# Since there have been warning messages in 4 of the 6 datasets,
# the first ESM item (name: V1) was automatically converted to class
# character, although it is numeric. So we'll re-convert V1's class.
# Check V1 prior to conversion
str(rmInvLs[["dfValid"]][[2]][1:2])
rmInvLs[["dfValid"]] <- sapply(rmInvLs[["dfValid"]], function(x) {
     x[,"V1"] <- as.numeric(x[,"V1"])
     return(x) } )
# Check V1 after conversion
str(rmInvLs[["dfValid"]][[2]][1:2])
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



