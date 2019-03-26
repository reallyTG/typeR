library(Peptides)


### Name: autoCovariance
### Title: Compute the auto-covariance index of a protein sequence
### Aliases: autoCovariance

### ** Examples

# Loading a property to evaluate its autocorrelation
data(AAdata)

# Calculate the auto-covariance index for a lag=1
autoCovariance(
  sequence = "SDKEVDEVDAALSDLEITLE",
  lag = 1,
  property = AAdata$Hydrophobicity$KyteDoolittle,
  center = TRUE
)
# [1] -0.4140053

# Calculate the auto-covariance index for a lag=5
autoCovariance(
  sequence = "SDKEVDEVDAALSDLEITLE",
  lag = 5,
  property = AAdata$Hydrophobicity$KyteDoolittle,
  center = TRUE
)
# [1] 0.001000336



