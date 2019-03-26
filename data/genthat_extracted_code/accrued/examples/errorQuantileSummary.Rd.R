library(accrued)


### Name: errorQuantileSummary
### Title: Summarizes accrual errors
### Aliases: errorQuantileSummary

### ** Examples

	data(accruedDataExample)			# simulated accrued data
	dat <- data.accrued(accruedDataExample)	
	errors <- accruedErrors(dat)
	errorQuantileSummary(errors, quantiles=seq(0.1,0.9,by=0.1) )



