library(Surrogate)


### Name: MarginalProbs
### Title: Computes marginal probabilities for a dataset where the
###   surrogate and true endpoints are binary
### Aliases: MarginalProbs
### Keywords: Marginal probabilities

### ** Examples

# Open the ARMD dataset and recode Diff24 and Diff52 as 1
# when the original value is above 0, and 0 otherwise
data(ARMD)
ARMD$Diff24_Dich <- ifelse(ARMD$Diff24>0, 1, 0)
ARMD$Diff52_Dich <- ifelse(ARMD$Diff52>0, 1, 0)

# Obtain marginal probabilities and ORs
MarginalProbs(Dataset=ARMD, Surr=Diff24_Dich, True=Diff52_Dich, 
Treat=Treat)






