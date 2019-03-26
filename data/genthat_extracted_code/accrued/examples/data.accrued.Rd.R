library(accrued)


### Name: data.accrued
### Title: Data structure for partially accruing data
### Aliases: data.accrued

### ** Examples

	
	# simulated accrued data
	data(accruedDataExample)				

	# Convert to data.accrued object
	dat <- data.accrued(accruedDataExample)	

	dat$start
	# This is 1 because no start date was specified.

	dat					# uses print.accrued
	summary(dat)		# uses summary.accrued

	plot(summary(dat)) 	# produces a plot of the summary object
	plot(dat)			# plots time series of differences between lags


	# Convert to data.accrued object, start date now specified.
	dat <- data.accrued(accruedDataExample, start="2012-09-15")	




