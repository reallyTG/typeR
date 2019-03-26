library(coin)


### Name: IndependenceTest
### Title: General Independence Test
### Aliases: independence_test independence_test.formula
###   independence_test.table independence_test.IndependenceProblem
### Keywords: htest

### ** Examples

## One-sided exact van der Waerden (normal scores) test...
independence_test(asat ~ group, data = asat,
                  ## exact null distribution
                  distribution = "exact",
                  ## one-sided test
                  alternative = "greater",
                  ## apply normal scores to asat$asat
                  ytrafo = function(data)
                      trafo(data, numeric_trafo = normal_trafo),
                  ## indicator matrix of 1st level of asat$group
                  xtrafo = function(data)
                      trafo(data, factor_trafo = function(x)
                          matrix(x == levels(x)[1], ncol = 1)))

## ...or more conveniently
normal_test(asat ~ group, data = asat,
            ## exact null distribution
            distribution = "exact",
            ## one-sided test
            alternative = "greater")


## Receptor binding assay of benzodiazepines
## Johnson, Mercante and May (1993, Tab. 1)
benzos <- data.frame(
      cerebellum = c( 3.41,  3.50,  2.85,  4.43,
                      4.04,  7.40,  5.63, 12.86,
                      6.03,  6.08,  5.75,  8.09,  7.56),
       brainstem = c( 3.46,  2.73,  2.22,  3.16,
                      2.59,  4.18,  3.10,  4.49,
                      6.78,  7.54,  5.29,  4.57,  5.39),
          cortex = c(10.52,  7.52,  4.57,  5.48,
                      7.16, 12.00,  9.36,  9.35,
                     11.54, 11.05,  9.92, 13.59, 13.21),
    hypothalamus = c(19.51, 10.00,  8.27, 10.26,
                     11.43, 19.13, 14.03, 15.59,
                     24.87, 14.16, 22.68, 19.93, 29.32),
        striatum = c( 6.98,  5.07,  3.57,  5.34,
                      4.57,  8.82,  5.76, 11.72,
                      6.98,  7.54,  7.66,  9.69,  8.09),
     hippocampus = c(20.31, 13.20,  8.58, 11.42,
                     13.79, 23.71, 18.35, 38.52,
                     21.56, 18.66, 19.24, 27.39, 26.55),
       treatment = factor(rep(c("Lorazepam", "Alprazolam", "Saline"),
                          c(4, 4, 5)))
)

## Approximative (Monte Carlo) multivariate Kruskal-Wallis test
## Johnson, Mercante and May (1993, Tab. 2)
independence_test(cerebellum + brainstem + cortex +
                  hypothalamus + striatum + hippocampus ~ treatment,
                  data = benzos,
                  teststat = "quadratic",
                  distribution = approximate(B = 10000),
                  ytrafo = function(data)
                      trafo(data, numeric_trafo = rank_trafo)) # Q = 16.129



