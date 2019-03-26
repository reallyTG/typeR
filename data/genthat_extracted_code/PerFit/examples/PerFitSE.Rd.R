library(PerFit)


### Name: PerFit.SE
### Title: Compute standard errors for person fit statistics
### Aliases: PerFit.SE
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the Ht scores:
Ht.out <- Ht(InadequacyData)

# Compute the SEs:
Ht.SE <- PerFit.SE(Ht.out)
Ht.SE




