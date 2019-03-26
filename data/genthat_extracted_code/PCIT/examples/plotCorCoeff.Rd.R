library(PCIT)


### Name: plotCorCoeff
### Title: Plot superimposed histograms of correlation coefficients
### Aliases: plotCorCoeff

### ** Examples

	data(PCIT)
	m <- m[1:200,1:200]        # just use a small subset of the data
	result <- pcit(m)
	
	op <- par(mfrow=c(2,1))
	plotCorCoeff(m, list("PCIT Significant" = idx(result)), col=c("black"))
	plotCorCoeff(m, list("PCIT Significant" = idx(result),
		"abs(adj) >= 0.7" = which(abs(m) >= 0.7)), col=c("black", "red"))
	par(op)



