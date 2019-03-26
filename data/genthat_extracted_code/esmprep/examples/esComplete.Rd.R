library(esmprep)


### Name: esComplete
### Title: esComplete
### Aliases: esComplete

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute esComplete. Start ---------------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# keyLsNew is a list of datasets, also delivered with the package
rmInvLs <- rmInvalid(keyLsNew, RELEVANTVN_ES)
plausibItems <- esItems(dfList=rmInvLs[["dfValid"]], RELEVANTVN_ES)
# Prerequisites in order to execute esComplete. End -----------------
# -------------------------------------------------------
# Run function 12 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Generate second argument of function 'esComplete'. It's strongly recommended
# to read the explantion of this 2nd argument in the esmprep vignette, function
# 'esComplete'.
lastItemList <- list(
# If in survey version "morningTestGroup" variable "V6" contains the value 0,
# then variable "V6_1" is the last item expected to contain data, else "V6" is the last item
# expected to contain data.
list("morningTestGroup", "V6", 0, "V6_1"),
# In survey version "dayTestGroup" variable "V7" is the last item expected to contain data;
# unlike above, no conditions; NA as 2nd and 3rd element of the inner list are mandatory.
list("dayTestGroup", NA, NA, "V7"),
# Information of all further ESM versions are passed accordingly:
list("eveningTestGroup", "V9", 1, "V9_1"),
list("morningControlGroup", "V6", 0, "V6_1"),
list("dayControlGroup", NA, NA, "V7"),
# The last ESM version has 2 conditions, therefore it is passed 2 times:
# If V8_1 contains a value between 1 and 5, then V8_3 is the last item expected to
# contain data.
list("eveningControlGroup", "V8_1", 1:5, "V8_3"),
# If V8_1 contains the value 0, then V8_2 is the last item expected to contain data.
list("eveningControlGroup", "V8_1", 0, "V8_2"))
# Apply function 'esComplete'. rmInvLs[["dfValid"]] is one of the results of function
# rmInvalid.
isCompleteLs <- esComplete(rmInvLs[["dfValid"]], lastItemList)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



