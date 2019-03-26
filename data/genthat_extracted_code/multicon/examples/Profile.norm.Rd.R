library(multicon)


### Name: Profile.norm
### Title: Normativeness
### Aliases: Profile.norm
### Keywords: normativeness residuals

### ** Examples

data(caq)
caq.norm <- Profile.norm(caq)
str(caq.norm)
	# The Mean CAQ profile
caq.norm$Means  
	# The Jackknifed Mean Profiles (the mean profile with its own case removed)
head(caq.norm$JackMeans) 
	# The profile correlations between my own CAQ and the Jackknifed Mean profile
caq.norm$Cors   
	# The regression coefficients between my own CAQ profile and the Jackknifed Mean profile
caq.norm$Regs  
	# The residuals after predicting my own CAQ profile with my Jackknifed Mean profile
head(caq.norm$Residuals)  


	



