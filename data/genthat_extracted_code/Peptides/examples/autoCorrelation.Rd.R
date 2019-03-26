library(Peptides)


### Name: autoCorrelation
### Title: Compute the auto-correlation index of a protein sequence
### Aliases: autoCorrelation

### ** Examples

# Loading a property to evaluate its autocorrelation
data(AAdata)

# Calculate the auto-correlation index for a lag=1
autoCorrelation(
  sequence = "SDKEVDEVDAALSDLEITLE",
  lag = 1,
  property = AAdata$Hydrophobicity$KyteDoolittle,
  center = TRUE
)
# [1] -0.3519908

# Calculate the auto-correlation index for a lag=5
autoCorrelation(
  sequence = "SDKEVDEVDAALSDLEITLE",
  lag = 5,
  property = AAdata$Hydrophobicity$KyteDoolittle,
  center = TRUE
)
# [1] 0.001133553



