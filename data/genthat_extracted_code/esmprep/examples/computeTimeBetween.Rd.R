library(esmprep)


### Name: computeTimeBetween
### Title: computeTimeBetween
### Aliases: computeTimeBetween

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute computeTimeBetween. Start -------
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# Use example list delivered with the package
RELEVANTVN_REF <- RELEVANTVN_REFext
intoleranceDf <- data.frame(prompt = c(2, 3, 4, 1, 1),
expect = c(1, 1, 1, 2, 3))
# expectedDf is a raw ESM dataset, delivered with the package.
intolLs <- intolerable(expectedDf, intoleranceDf, RELEVANTINFO_ES)
randSelLs <- randomMultSelection(intolLs[["cleanedDf"]])
# Prerequisites in order to execute computeTimeBetween. End ---------
# -------------------------------------------------------
# Run function 27 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# randSelLs[["esRandSelIn"]] is the result of function 'randomMultSelection'.
tbsqDf <- computeTimeBetween(randSelLs[["esRandSelIn"]], referenceDfNew, RELEVANTVN_ES,
RELEVANTVN_REF)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



