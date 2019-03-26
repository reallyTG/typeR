library(ncvreg)


### Name: permres
### Title: Permute residuals for a fitted ncvreg model
### Aliases: permres permres.ncvreg

### ** Examples

data(Prostate)
fit <- ncvreg(Prostate$X, Prostate$y, N=50)
permres(fit, lambda=0.15)



