library(multicon)


### Name: Profile.r.rep
### Title: Profile Correlation Replicability
### Aliases: Profile.r.rep
### Keywords: replicability distinctiveness profile correlations

### ** Examples

data(acq1)
data(caq)
	#Lets look at Profile correlations between self-report California Adult Q-Sort 
	#ratings of personality and Aquaintance #ratings
names(acq1)
names(caq)
	# The basic Profile agreements
Profile.r(caq, acq1)  
	# Both overall and distinctive agreements
Profile.r(caq, acq1, distinct = TRUE)$Agreement 
	# How replicable (reliable) are those agreement patterns?
Profile.r.rep(caq, acq1)



