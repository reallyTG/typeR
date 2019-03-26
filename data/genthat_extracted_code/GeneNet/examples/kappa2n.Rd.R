library(GeneNet)


### Name: kappa2n
### Title: Relationship Between Sample Size and the Degree of Freedom of
###   Correlation Distribution
### Aliases: kappa2n n2kappa
### Keywords: univar

### ** Examples

# load GeneNet library
library("GeneNet")


# sample sizes corresponding to kappa=7
kappa2n(7)     # simple correlation
kappa2n(7, 40) # partial correlation with p=40 variables

# degree of freedom corresponding to n=100
n2kappa(100)
n2kappa(100,40)



