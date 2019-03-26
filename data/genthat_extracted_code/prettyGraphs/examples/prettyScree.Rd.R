library(prettyGraphs)


### Name: prettyScree
### Title: prettyScree
### Aliases: prettyScree
### Keywords: multivariate

### ** Examples

	prcomp.res <- prcomp(USArrests, scale = TRUE)
	prettyScree(prcomp.res$sdev^2)
	##or
	princomp.res <- princomp(USArrests, cor = TRUE)	
	prettyScree(princomp.res$sdev^2)



