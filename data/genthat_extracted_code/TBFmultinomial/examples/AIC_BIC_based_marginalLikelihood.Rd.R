library(TBFmultinomial)


### Name: AIC_BIC_based_marginalLikelihood
### Title: Marginal likelihoods based on AIC or BIC
### Aliases: AIC_BIC_based_marginalLikelihood

### ** Examples

# data extraction:
data("VAP_data")

# the definition of the full model with three potential predictors:
FULL <- outcome ~ ns(day, df = 4) + gender + type + SOFA
# here the define time as a spline with 3 knots

# now we can compute the marginal likelihoods based on the AIC f.ex:
mL_AIC <-
AIC_BIC_based_marginalLikelihood(fullModel = FULL,
                                 data = VAP_data,
                                 discreteSurv = TRUE,
                                 AIC = TRUE)



