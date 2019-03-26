library(mvabund)


### Name: summary.manylm
### Title: Summarizing Linear Model Fits for Multivariate Abundance Data
### Aliases: summary.manylm print.summary.manylm
### Keywords: models regression multivariate

### ** Examples

data(spider)
spiddat <- log(spider$abund+1)
spiddat <- mvabund(spiddat)
spidx <- spider$x

## Estimate the coefficients of a multivariate linear model:
fit <- manylm(spiddat~spidx)

## To summarise this multivariate fit, using score resampling to
## and F Test statistic to estimate significance:
summary(fit, resamp="score", test="F")

## Instead using residual permutation with 2000 iteration, using the sum of F 
## statistics to estimate multivariate significance, but also reporting 
## univariate statistics with adjusted P-values:
summary(fit, resamp="perm.resid", nBoot=2000, test="F", p.uni="adjusted")

## Obtain a summary of test statistics using residual resampling, accounting 
## for correlation between variables but shrinking the correlation matrix to 
## improve its stability and showing univariate p-values:
summary(fit, cor.type="shrink", p.uni="adjusted")




