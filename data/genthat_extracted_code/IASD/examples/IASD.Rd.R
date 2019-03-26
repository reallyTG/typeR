library(IASD)


### Name: IASD
### Title: Model Selection for Index of Asymmetry Distribution
### Aliases: IASD
### Keywords: AIC IAS

### ** Examples

	df = data.frame(ID = c(1:5), IAS = c(8.3, 12.7, -12.7, -7.3, -8.1),
	   IAS2 = c(14.2, 8.8, -12.7, -8.6, -10.5),
	   IAS3 = c(1.04, 1.28, -0.78, -0.84, -0.85))
	result = IASD(df) # calculate AIC's and AICc's
	result = IASD(df, cols = c(2,4), plotGraph = FALSE) 
		# use data in the second and fourth columns, do not plot graphs
	result = IASD(df, filePrefix="P.microlepis", xlimMin = -15, 
	xlimMax = 15, dHist = c(1, 1, 0.1))  
		# file name of each plot starts with "P.microlepis", plot range 
		# and width of histgram bar is changed



