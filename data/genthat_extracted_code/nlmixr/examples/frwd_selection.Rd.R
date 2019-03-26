library(nlmixr)


### Name: frwd_selection
### Title: Forward covariate selection for nlme-base non-linear mixed
###   effect models
### Aliases: frwd_selection

### ** Examples

dat <- theo_md
dat$LOGWT <- log(dat$WT)
dat$TG <- (dat$ID < 6) + 0    #dummy covariate

specs <- list(
	fixed=list(lKA=lKA~1, lCL=lCL~1, lV=lV~1),
	random = pdDiag(lKA+lCL~1),
	start=c(0.5, -3.2, -1))
fit0 <- nlme_lin_cmpt(dat, par_model=specs, ncmt=1)
cv <- list(lCL=c("WT", "TG"), lV=c("WT"))
fit <- frwd_selection(fit0, cv, dat)
print(summary(fit))



