library(reldist)


### Name: gini
### Title: Compute the Gini Coefficient
### Aliases: gini
### Keywords: univar

### ** Examples

# generate vector (of incomes)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
# compute Gini coefficient
gini(x)
# generate a vector of weights.
w <- runif(n=length(x))
gini(x,w)
#
# Compute the inequality in income growth for the recent cohort of the
# National Longitudinal Survey (NLS) initiated in 1979.
#
library(reldist)
data(nls)
help(nls)
# Compute the wage growth
y <- exp(recent$chpermwage)
# Compute the unweighted estimate
gini(y)
# Compute the weighted estimate
gini(y,w=recent$wgt)



