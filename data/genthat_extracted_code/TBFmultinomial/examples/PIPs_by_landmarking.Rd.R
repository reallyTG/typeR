library(TBFmultinomial)


### Name: PIPs_by_landmarking
### Title: Posterior inclusion probabilities (PIPs) by landmarking
### Aliases: PIPs_by_landmarking

### ** Examples

# extract the data:
data("VAP_data")

# the definition of the full model with three potential predictors:
FULL <- outcome ~ ns(day, df = 4) + gender + type + SOFA
# here we define time as a spline with 3 knots

PIPs_landmark <- PIPs_by_landmarking(fullModel = FULL, data = VAP_data,
                                     discreteSurv = TRUE, numberCores = 1,
                                     package = 'nnet', maxit = 150,
                                     prior = 'flat',  method = 'LEB',
                                     landmarkLength = 7, lastlandmark = 21,
                                     timeVariableName = 'day')



