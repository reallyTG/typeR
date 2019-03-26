library(AutoSEARCH)


### Name: gedestp
### Title: Estimate and compute log-likelihood of the standardised
###   Generalised Error Distribution (GED)
### Aliases: gedestp gedlogl
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

#estimate p of a standard normal:
set.seed(123)
x <- rnorm(200)
gedestp(x)

#log-likelihood of the standard normal series:
gedlogl(x, p=2)



