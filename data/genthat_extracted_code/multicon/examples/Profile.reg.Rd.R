library(multicon)


### Name: Profile.reg
### Title: Profile Regression Coefficients
### Aliases: Profile.reg
### Keywords: regression profile agreement

### ** Examples

data(acq1)
data(caq)
	#Lets get the regression coeficients for 
	#predicting aquaintance California Adult Q-Set (CAQ) 
	#personality ratings from #self-report CAQ ratings 
Profile.reg(caq, acq1)
	# Get descriptives for the results
describe(Profile.reg(caq, acq1)) 
	
	


