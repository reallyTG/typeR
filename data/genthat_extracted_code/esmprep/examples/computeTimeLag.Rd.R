library(esmprep)


### Name: computeTimeLag
### Title: computeTimeLag
### Aliases: computeTimeLag

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute computeTimeLag. Start -----------
# RELEVANTINFO_ES is delivered with the package
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
intoleranceDf <- data.frame(prompt = c(2, 3, 4, 1, 1),
expect = c(1, 1, 1, 2, 3))
# expectedDf is a raw ESM dataset, delivered with the package.
intolLs <- intolerable(expectedDf, intoleranceDf, RELEVANTINFO_ES)
randSelLs <- randomMultSelection(intolLs[["cleanedDf"]])
# Prerequisites in order to execute computeTimeLag. End -------------
# -------------------------------------------------------
# Run function 25 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# randSelLs[["esRandSelIn"]] is the result of function 'randomMultSelection'.
lagDf <- computeTimeLag(randSelLs[["esRandSelIn"]], RELEVANTVN_ES)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



