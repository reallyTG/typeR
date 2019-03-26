library(PerFit)


### Name: flagged.resp
### Title: Find (potentially) aberrant response patterns
### Aliases: flagged.resp
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)
Ht.out$PFscores

# Estimate the cutoff value at 1% level:
Ht.cut <- cutoff(Ht.out, Blvl=.01)

# Determine which respondents were flagged by Ht at 1% level:
flagged.resp(Ht.out, Ht.cut, scores=FALSE)$PFSscores



