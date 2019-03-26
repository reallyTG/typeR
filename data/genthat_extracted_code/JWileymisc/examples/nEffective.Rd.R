library(JWileymisc)


### Name: nEffective
### Title: Estimate the effective sample size from longitudinal data
### Aliases: nEffective
### Keywords: multivariate

### ** Examples

## example where n, k, and icc are estimated from the data
## provided, partly using iccMixed function
nEffective(dv = "mpg", id = "cyl", data = mtcars)

## example where n, k, and icc are known (or being 'set')
## useful for sensitivity analyses
nEffective(n = 60, k = 10, icc = .6)



