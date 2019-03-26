library(MPDiR)


### Name: lpois
### Title: Likelihoods for Poisson and Gaussian psychometric functions
### Aliases: lpois lpois1 lnorm
### Keywords: models

### ** Examples

data(HSP)
SHR2 <- subset(HSP, Obs == "SH" & Run == "R2")
SHR2 <- within(SHR2, {
	nyes <- N * p/100
	nno <- N - nyes
	})
optim(par = c(5, 0.35), lnorm, d = SHR2)



