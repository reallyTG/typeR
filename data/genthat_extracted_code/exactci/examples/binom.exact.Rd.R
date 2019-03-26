library(exactci)


### Name: binom.exact
### Title: Exact tests with matching confidence intervals for single
###   binomial parameter
### Aliases: binom.exact
### Keywords: htest

### ** Examples

## Notice how binom.test p-value is given by tsmethod='minlike'
## but the confidence interval is given by tsmethod='central'
## in binom.exact p-values and confidence intervals match
binom.test(10,12,p=20000/37877)
binom.exact(10,12,p=20000/37877,tsmethod="minlike")
binom.exact(10,12,p=20000/37877,tsmethod="central")
binom.exact(10,12,p=20000/37877,tsmethod="blaker")
## one-sided methods are also available
## as in binom.test




