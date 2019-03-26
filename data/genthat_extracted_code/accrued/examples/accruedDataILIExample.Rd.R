library(accrued)


### Name: accruedDataILIExample
### Title: Data set for illustrating accrued data methods
### Aliases: accruedDataILIExample
### Keywords: datasets

### ** Examples

	# denominator
	data(accruedDataExample)
	testData = data.accrued(accruedDataExample)

	# numerator
	data(accruedDataILIExample)
	testData2 = data.accrued(accruedDataILIExample)

	errors = accruedErrors(testData, testData2)
	plot(errors)
	summary(errors)



