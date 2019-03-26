library(PerFit)


### Name: PRFplot
### Title: Person response function (PRF)
### Aliases: PRFplot
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)
Ht.out$PFscores

# Determine which respondents were flagged by Ht at 1% level:
set.seed(124) # To fix the random seed generator.
Ht.flagged <- flagged.resp(Ht.out, Blvl=.01, scores=FALSE)
Ht.flagged <- Ht.flagged$PFSscores[,1]
# Flagged respondents: 30  37  46  49 137 216 531.

# Plot the PRFs of the first three flagged respondents:
Flagged    <- PRFplot(InadequacyData, respID=Ht.flagged[1:3])
# Plot the person response function of respondent 35 (not flagged as aberrant):
PRFplot(InadequacyData, respID=35)
# Plot the PRFs of all respondents:
plot(Flagged$PRF.FDO)



