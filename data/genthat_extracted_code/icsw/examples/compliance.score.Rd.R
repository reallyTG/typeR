library(icsw)


### Name: compliance.score
### Title: Estimate compliance scores using covariates.
### Aliases: compliance.score
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Load example dataset, see help(FoxDebate) for details
data(FoxDebate)

# Matrix of covariates
covmat <- with(FoxDebate, cbind(partyid, pnintst, watchnat, educad, readnews, 
                                gender, income, white))

# Estimate compliance scores with covariates, assuming (default) 
#   case of two-sided non-compliance
cscoreout <- with(FoxDebate, compliance.score(D = watchpro, Z = conditn,
                                              W = covmat))

# Extract vector of estimated compliance scores
cscore <- cscoreout$C.score
summary(cscore)




