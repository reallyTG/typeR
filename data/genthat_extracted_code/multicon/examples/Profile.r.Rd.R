library(multicon)


### Name: Profile.r
### Title: Profile Correlations
### Aliases: Profile.r
### Keywords: accuracy profile correlations agreement distinctiveness

### ** Examples

data(acq1)
data(caq)
	#Lets look at Profile correlations between self-report California Adult Q-Sort 
	#ratings of personality and Aquaintance ratings of the same person.
head(acq1)
head(caq)
Profile.r(caq, acq1)  # The basic Profile agreements
describe.r(Profile.r(caq, acq1)) # Descriptive Statistics for the Agreements
	# Now let's look at both overall and distinctive agreement
myres <- Profile.r(caq, acq1, distinct = TRUE)
myres
describe.r(myres$Agreement) # The average overall and distinctive agreements
	



