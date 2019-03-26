library(mfp)


### Name: mfp
### Title: Fit a Multiple Fractional Polynomial Model
### Aliases: mfp
### Keywords: models

### ** Examples

	data(GBSG)
	f <- mfp(Surv(rfst, cens) ~ fp(age, df = 4, select = 0.05)
                 + fp(prm, df = 4, select = 0.05), family = cox, data = GBSG)
	print(f)
	survfit(f$fit)  # use proposed coxph model fit for survival curve estimation



