library(coin)


### Name: PermutationDistribution-methods
### Title: Computation of the Permutation Distribution
### Aliases: dperm dperm-methods dperm,IndependenceTest-method
###   dperm,NullDistribution-method pperm pperm-methods
###   pperm,IndependenceTest-method pperm,NullDistribution-method qperm
###   qperm-methods qperm,IndependenceTest-method
###   qperm,NullDistribution-method rperm rperm-methods
###   rperm,IndependenceTest-method rperm,NullDistribution-method support
###   support-methods support,IndependenceTest-method
###   support,NullDistribution-method
### Keywords: methods htest distribution

### ** Examples

## Two-sample problem
dta <- data.frame(
    y = rnorm(20),
    x = gl(2, 10)
)

## Exact Ansari-Bradley test
at <- ansari_test(y ~ x, data = dta, distribution = "exact")

## Support of the exact distribution of the Ansari-Bradley statistic
supp <- support(at)

## Density of the exact distribution of the Ansari-Bradley statistic
dens <- dperm(at, x = supp)

## Plotting the density
plot(supp, dens, type = "s")

## 95 % quantile
qperm(at, p = 0.95)

## One-sided p-value
pperm(at, q = statistic(at))

## Random number generation
rperm(at, n = 5)



