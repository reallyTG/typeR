library(PerFit)


### Name: PerFit.PFS
### Title: Compute several person-fit statistics
### Aliases: PerFit.PFS
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# Compute the lzstar, U3, and Ht scores:
PerFit.PFS(InadequacyData, method=c("lzstar", "U3", "Ht"))



