library(metRology)


### Name: cov.dellipse
### Title: Constructs a covariance and location object for use in plotting
###   data ellipses.
### Aliases: cov.dellipse
### Keywords: robust multivariate

### ** Examples

data(potassium)
cov.dellipse(potassium) #Defaults to Spearman rank correlation

#With different method
cov.dellipse(potassium, cov.method="OGK") 

#Same as above but specifying control parameters
library(robustbase) #For scaleTau2
cov.dellipse(potassium, cov.method="OGK", cov.control=list(sigmamu=scaleTau2)) 
	
#With individually specified (mad) scale
cov.dellipse(potassium, cov.method="GK", scalefn=mad) 
	#Defaults to median for location because mad()
	#does not accept a mu.too argument

cov.dellipse(potassium, cov.method="GK", scalefn=scaleTau2) 
	#Defaults to specified scalefn for location because scaleTau2 
	#accepts mu.too=TRUE




