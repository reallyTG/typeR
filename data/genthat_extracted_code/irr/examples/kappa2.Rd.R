library(irr)


### Name: kappa2
### Title: Cohen's Kappa and weighted Kappa for two raters
### Aliases: kappa2
### Keywords: univar

### ** Examples

data(anxiety)
kappa2(anxiety[,1:2], "squared") # predefined set of squared weights
kappa2(anxiety[,1:2], (0:5)^2)   # same result with own set of squared weights

# own weights increasing gradually with larger distance from perfect agreement
kappa2(anxiety[,1:2], c(0,1,2,4,7,11))

data(diagnoses)
# Unweighted Kappa for categorical data without a logical order
kappa2(diagnoses[,2:3])



