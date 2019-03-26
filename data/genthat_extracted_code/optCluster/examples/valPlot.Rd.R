library(optCluster)


### Name: valPlot
### Title: Validation Measure Plots
### Aliases: valPlot

### ** Examples

	
	## This example may take a few minutes to compute
	## No test: 
	## Obtain Dataset	
	data(arabid)	
	
	## Normalize Data with Respect to Library Size	
	obj <- t(t(arabid)/colSums(arabid))
		
	## Analysis of Normalized Data using Internal and Stability Validation Measures
	norm1 <- optCluster(obj, 2:4, clMethods = "all")
	
	## Plots of Internal and Stability Validation Measures
	par(mfrow = c(4,2))
	valPlot(norm1)
	
	## Plots of Internal Validation Measures in a Single Figure
	par(mfrow = c(2,2))
	valPlot(norm1, measure = c("Dunn", "Silhouette", "Connectivity"), legend = FALSE)
	plot(0, type="n", axes=FALSE, xlab = "", ylab = "")
	legend("center", methodNames(norm1), col=1:9, lty=1:9, pch=paste(c(1:9)), 
			cex=0.8)		
	
## End(No test)



