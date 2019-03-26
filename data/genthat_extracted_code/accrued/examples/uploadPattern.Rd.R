library(accrued)


### Name: uploadPattern
### Title: Function to create an upload pattern plot
### Aliases: uploadPattern

### ** Examples

	data(accruedDataExample)			
	testData <- data.accrued(accruedDataExample)	
	uploadPattern(testData)					# Diagonal plot (default)
	dev.new(height = 1.5, width = 10)		# Horizontal plot - best short and wide
	uploadPattern(testData, horizontal = TRUE)				



