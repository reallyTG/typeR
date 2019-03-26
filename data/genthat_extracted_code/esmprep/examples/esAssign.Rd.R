library(esmprep)


### Name: esAssign
### Title: esAssign
### Aliases: esAssign

### ** Examples

# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o
# Prerequisites in order to execute esAssign. Start -----------------
# esMerged1 is the raw ESM dataset, also delivered with the package
# referenceDfNew is the modified reference dataset, delivered with
# the package.
# RELEVANTINFO_ES is delivered with the package
# Use example list delivered with the package
RELEVANTVN_ES <- RELEVANTVN_ESext
# Use example list delivered with the package
RELEVANTVN_REF <- RELEVANTVN_REFext
# Prerequisites in order to execute esAssign. End -------------------
# -------------------------------------------------------
# Run function 16 of 28; see esmprep functions' hierarchy.
# -------------------------------------------------------
# Assign questionnaires contained in the raw ESM dataset to all participants listed
# in the reference dataset. esMerged1 is the result of function 'convertChars',
# referenceDfNew is the result of function 'genDateTime' or of function
# 'splitDateTime'.
# Run only the first 2 out of 8 participants (saves time). The warning message the
# user receives in this case (2 out of 8 participants) is correct.
esAssigned <- esAssign(esDf = esMerged1, refDf = referenceDfNew[1:2,], RELEVANTINFO_ES,
RELEVANTVN_ES, RELEVANTVN_REF)
# # Assign questionnaires contained in the raw ESM dataset to participant P001 listed
# # in the reference dataset.
# esAssigned <- esAssign(esDf = esMerged1, refDf = referenceDfNew, RELEVANTINFO_ES,
# RELEVANTVN_ES, RELEVANTVN_REF, singlePerson="P001")
# More options can be passed to 'esAssign', see parameter description. Note that when
# setting the argument midnightPrompt to TRUE, esAssign takes a bit longer to do its job.
# Output: List with 4 data.frames.
names(esAssigned)
# o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o=o



