library(TBFmultinomial)


### Name: postInclusionProb
### Title: Posterior inclusion probability (PIP)
### Aliases: postInclusionProb

### ** Examples

# extract the data:
data("VAP_data")

# the definition of the full model with three potential predictors:
FULL <- outcome ~ ns(day, df = 4) + gender + type + SOFA
# here we define time as a spline with 3 knots

# computation of the posterior model probabilities:
test <- PMP(fullModel = FULL, data = VAP_data,
            discreteSurv = TRUE, maxit = 150)
class(test)

#computation of the posterior inclusion probabilities:
postInclusionProb(test)




