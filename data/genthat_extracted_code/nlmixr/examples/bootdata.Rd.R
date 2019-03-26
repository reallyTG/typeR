library(nlmixr)


### Name: bootdata
### Title: Bootstrap data
### Aliases: bootdata

### ** Examples


specs <- list(fixed=lKA+lCL+lV~1, random = pdDiag(lKA+lCL~1), start=c(lKA=0.5, lCL=-3.2, lV=-1))
set.seed(99); nboot = 5;

cat("generating", nboot, "bootstrap samples...\n")
cmat <- matrix(NA, nboot, 3)
for (i in 1:nboot)
{
	#print(i)
	bd <- bootdata(theo_md)
	fit <- nlme_lin_cmpt(bd, par_model=specs, ncmt=1)
	cmat[i,] = fit$coefficients$fixed
}
dimnames(cmat)[[2]] <- names(fit$coefficients$fixed)
print(head(cmat))




