library(pheno)


### Name: pheno.lad.fit
### Title: Fits a robust two-way linear model
### Aliases: pheno.lad.fit
### Keywords: design models ts

### ** Examples

	data(DWD)
	R <- pheno.lad.fit(DWD)				# robust parameter estimation
	plot(levels(factor(R$D[[2]])),R$p1,type="l")	# plot combined time series
	R$D[R$resid >= 30,]				# observation whose residuals
							# are > 30 days (outliers)



