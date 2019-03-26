library(tolerance)


### Name: distfree.est
### Title: Estimating Various Quantities for Distribution-Free Tolerance
###   Intervals
### Aliases: distfree.est
### Keywords: file

### ** Examples
 
## Solving for 1 minus the confidence level.

distfree.est(n = 59, P = 0.95, side = 1)

## Solving for the sample size.

distfree.est(alpha = 0.05, P = 0.95, side = 1)

## Solving for the proportion of the population to cover.

distfree.est(n = 59, alpha = 0.05, side = 1)

## Solving for sample sizes for many tolerance specifications.

distfree.est(alpha = seq(0.01, 0.05, 0.01), 
             P = seq(0.80, 0.99, 0.01), side = 2)





