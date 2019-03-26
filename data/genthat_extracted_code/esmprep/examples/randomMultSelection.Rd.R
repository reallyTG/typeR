library(esmprep)


### Name: randomMultSelection
### Title: randomMultSelection
### Aliases: randomMultSelection

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute randomMultSelection. Start ------
# RELEVANTINFO_ES is delivered with the package
intoleranceDf <- data.frame(prompt = c(2, 3, 4, 1, 1),
expect = c(1, 1, 1, 2, 3))
# expectedDf is a raw ESM dataset, delivered with the package.
intolLs <- intolerable(expectedDf, intoleranceDf, RELEVANTINFO_ES)
# Prerequisites in order to execute randomMultSelection. End --------
# -------------------------------------------------------
# Run function 24 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# intolLs[["cleanedDf"]] is the result of function 'intolerable'.
randSelLs <- randomMultSelection(intolLs[["cleanedDf"]])
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



