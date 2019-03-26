library(coin)


### Name: ScaleTests
### Title: Two- and K-Sample Scale Tests
### Aliases: taha_test taha_test.formula taha_test.IndependenceProblem
###   klotz_test klotz_test.formula klotz_test.IndependenceProblem
###   mood_test mood_test.formula mood_test.IndependenceProblem ansari_test
###   ansari_test.formula ansari_test.IndependenceProblem fligner_test
###   fligner_test.formula fligner_test.IndependenceProblem conover_test
###   conover_test.formula conover_test.IndependenceProblem
### Keywords: htest

### ** Examples

## Serum Iron Determination Using Hyland Control Sera
## Hollander and Wolfe (1999, p. 147, Tab 5.1)
sid <- data.frame(
    serum = c(111, 107, 100, 99, 102, 106, 109, 108, 104, 99,
              101, 96, 97, 102, 107, 113, 116, 113, 110, 98,
              107, 108, 106, 98, 105, 103, 110, 105, 104,
              100, 96, 108, 103, 104, 114, 114, 113, 108, 106, 99),
    method = gl(2, 20, labels = c("Ramsay", "Jung-Parekh"))
)

## Asymptotic Ansari-Bradley test
ansari_test(serum ~ method, data = sid)

## Exact Ansari-Bradley test
pvalue(ansari_test(serum ~ method, data = sid,
                   distribution = "exact"))


## Platelet Counts of Newborn Infants
## Hollander and Wolfe (1999, p. 171, Tab. 5.4)
platelet <- data.frame(
    counts = c(120, 124, 215, 90, 67, 95, 190, 180, 135, 399,
               12, 20, 112, 32, 60, 40),
    treatment = factor(rep(c("Prednisone", "Control"), c(10, 6)))
)

## Approximative (Monte Carlo) Lepage test
## Hollander and Wolfe (1999, p. 172)
lepage_trafo <- function(y)
    cbind("Location" = rank_trafo(y), "Scale" = ansari_trafo(y))

independence_test(counts ~ treatment, data = platelet,
                  distribution = approximate(B = 10000),
                  ytrafo = function(data)
                      trafo(data, numeric_trafo = lepage_trafo),
                  teststat = "quadratic")

## Why was the null hypothesis rejected?
## Note: maximum statistic instead of quadratic form
ltm <- independence_test(counts ~ treatment, data = platelet,
                         distribution = approximate(B = 10000),
                         ytrafo = function(data)
                             trafo(data, numeric_trafo = lepage_trafo))

## Step-down adjustment suggests a difference in location
pvalue(ltm, method = "step-down")

## The same results are obtained from the simple Sidak-Holm procedure since the
## correlation between Wilcoxon and Ansari-Bradley test statistics is zero
cov2cor(covariance(ltm))
pvalue(ltm, method = "step-down", distribution = "marginal", type = "Sidak")



