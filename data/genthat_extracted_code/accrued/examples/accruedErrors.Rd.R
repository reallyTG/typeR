library(accrued)


### Name: accruedErrors
### Title: Function to calculate error between partially accrued data and
###   final data
### Aliases: accruedErrors

### ** Examples

	data(accruedDataExample)	# simulated accrued data 
	testData <- data.accrued(accruedDataExample)	
	errors <- accruedErrors(testData)
	plot(errors)
	errors <- accruedErrors(testData, func = function(a,b) {sqrt(a) - sqrt(b)} )
	plot(errors)
	
	data(accruedDataILIExample)	# simulated accrued data - ILI counts
	testData2 = data.accrued(accruedDataILIExample)
	errors <- accruedErrors(testData, testData2)
	plot(errors)



