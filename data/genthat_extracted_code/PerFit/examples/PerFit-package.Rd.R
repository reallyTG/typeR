library(PerFit)


### Name: PerFit-package
### Title: Person Fit
### Aliases: PerFit-package PerFit

### ** Examples


# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)
# Ht.out$PFscores

# Compute the cutoff value at 1% level:
set.seed(124) # To fix the random seed generator.
Ht.cut <- cutoff(Ht.out, Blvl=.01)

# Plot the sample distribution of the Ht scores with the above cutoff superimposed:
plot(Ht.out, cutoff.obj=Ht.cut)

# Determine which respondents were flagged by Ht at 1% level:
flagged.resp(Ht.out, cutoff.obj=Ht.cut, scores=FALSE)
# Flagged respondents: 30, 37, 46, 49,...

# Plot the person response function of respondent 30 (flagged as aberrant):
Resp30 <- PRFplot(InadequacyData, respID=30)
# Plot the person response function of respondent 35 (not flagged as aberrant):
Resp35 <- PRFplot(InadequacyData, respID=35)



