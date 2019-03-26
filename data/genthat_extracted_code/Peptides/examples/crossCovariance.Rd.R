library(Peptides)


### Name: crossCovariance
### Title: Compute the cross-covariance index of a protein sequence
### Aliases: crossCovariance

### ** Examples

# Loading a property to evaluate its autocorrelation
data(AAdata)

# Calculate the cross-covariance index for a lag=1
crossCovariance(
  sequence = "SDKEVDEVDAALSDLEITLE",
  lag = 1,
  property1 = AAdata$Hydrophobicity$KyteDoolittle,
  property2 = AAdata$Hydrophobicity$Eisenberg,
  center = TRUE
)
# [1] -0.3026609

# Calculate the cross-correlation index for a lag=5
crossCovariance(
  sequence = "SDKEVDEVDAALSDLEITLE",
  lag = 5,
  property1 = AAdata$Hydrophobicity$KyteDoolittle,
  property2 = AAdata$Hydrophobicity$Eisenberg,
  center = TRUE
)
# [1] 0.02598035



