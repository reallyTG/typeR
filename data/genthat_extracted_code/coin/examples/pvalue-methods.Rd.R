library(coin)


### Name: pvalue-methods
### Title: Computation of the p-Value, Mid-p-Value and p-Value Interval
### Aliases: pvalue pvalue-methods pvalue,IndependenceTest-method
###   pvalue,MaxTypeIndependenceTest-method pvalue,NullDistribution-method
###   midpvalue midpvalue-methods midpvalue,IndependenceTest-method
###   midpvalue,NullDistribution-method pvalue_interval
###   pvalue_interval-methods pvalue_interval,IndependenceTest-method
###   pvalue_interval,NullDistribution-method
### Keywords: methods htest

### ** Examples

## Two-sample problem
dta <- data.frame(
    y = rnorm(20),
    x = gl(2, 10)
)

## Exact Ansari-Bradley test
(at <- ansari_test(y ~ x, data = dta, distribution = "exact"))
pvalue(at)
midpvalue(at)
pvalue_interval(at)


## Bivariate two-sample problem
dta2 <- data.frame(
    y1 = rnorm(20) + rep(0:1, each = 10),
    y2 = rnorm(20),
    x = gl(2, 10)
)

## Approximative (Monte Carlo) bivariate Fisher-Pitman test
(it <- independence_test(y1 + y2 ~ x, data = dta2,
                         distribution = approximate(B = 10000)))

## Global p-value
pvalue(it)

## Joint distribution single-step p-values
pvalue(it, method = "single-step")

## Joint distribution step-down p-values
pvalue(it, method = "step-down")

## Sidak step-down p-values
pvalue(it, method = "step-down", distribution = "marginal", type = "Sidak")

## Unadjusted p-values
pvalue(it, method = "unadjusted")


## Length of YOY Gizzard Shad (Hollander and Wolfe, 1999, p. 200, Tab. 6.3)
yoy <- data.frame(
    length = c(46, 28, 46, 37, 32, 41, 42, 45, 38, 44,
               42, 60, 32, 42, 45, 58, 27, 51, 42, 52,
               38, 33, 26, 25, 28, 28, 26, 27, 27, 27,
               31, 30, 27, 29, 30, 25, 25, 24, 27, 30),
    site = gl(4, 10, labels = as.roman(1:4))
)

## Approximative (Monte Carlo) Fisher-Pitman test with contrasts
## Note: all pairwise comparisons
(it <- independence_test(length ~ site, data = yoy,
                         distribution = approximate(B = 10000),
                         xtrafo = mcp_trafo(site = "Tukey")))

## Joint distribution step-down p-values
pvalue(it, method = "step-down") # subset pivotality is violated



