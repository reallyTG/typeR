library(lavaan)


### Name: getCov
### Title: Utility Functions For Covariance Matrices
### Aliases: getCov cor2cov char2num

### ** Examples

# The classic Wheaton et. al. (1977) model 
# panel data on he stability of alienation
lower <- '
 11.834,
  6.947,    9.364,
  6.819,    5.091,   12.532,
  4.783,    5.028,    7.495,    9.986,
 -3.839,   -3.889,   -3.841,   -3.625,   9.610,
-21.899,  -18.831,  -21.748,  -18.775,  35.522,  450.288 '

# convert to a full symmetric covariance matrix with names
wheaton.cov <- getCov(lower, names=c("anomia67","powerless67", "anomia71",
                                     "powerless71","education","sei"))

# the model
wheaton.model <- '
  # measurement model
    ses     =~ education + sei
    alien67 =~ anomia67 + powerless67
    alien71 =~ anomia71 + powerless71

  # equations
    alien71 ~ alien67 + ses
    alien67 ~ ses

  # correlated residuals
    anomia67 ~~ anomia71
    powerless67 ~~ powerless71
'

# fitting the model
fit <- sem(wheaton.model, sample.cov=wheaton.cov, sample.nobs=932)

# showing the results
summary(fit, standardized=TRUE)



