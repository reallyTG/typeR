library(pheno)


### Name: pheno.mlm.fit
### Title: Fits a two-way linear mixed model
### Aliases: pheno.mlm.fit
### Keywords: design models ts

### ** Examples

	data(DWD)
	R <- pheno.mlm.fit(DWD)								# parameter estimation
	plot(levels(factor(DWD[[2]])),R$fixed,type="l")		# plot combined time series
	tr <- lm(R$fixed~rank(levels(factor(DWD[[2]]))))	# trend estimation
	summary(tr)$coef[2]									# slope of trend
	summary(tr)$coef[4]									# standard error of trend



