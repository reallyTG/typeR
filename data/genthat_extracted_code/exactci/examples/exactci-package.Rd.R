library(exactci)


### Name: exactci-package
### Title: Exact binomial and Poisson tests with Matching Confidence
###   Intervals
### Aliases: exactci-package exactci
### Keywords: package htest

### ** Examples

## Note binom.test calculates p-values using priciple of minimum likelihood
## while it calculates the central confidence intervals. That is why the 
## inferences do not match in this example.
binom.test(10,12,p=20000/37877)
binom.exact(10,12,p=20000/37877,tsmethod="minlike")
binom.exact(10,12,p=20000/37877,tsmethod="central")
## We also allow the method studied in Blaker (2000)
binom.exact(10,12,p=20000/37877,tsmethod="blaker")



