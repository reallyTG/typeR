library(multicon)


### Name: alpha.cov
### Title: Cronbach's Alpha of Covariance Matrix
### Aliases: alpha.cov
### Keywords: alpha covariance

### ** Examples
	
data(RSPdata)
names(RSPdata)
	# Forming a composite:
	# We will first form a composite extraversion variable using
	# BFI scores. 
    # Three items need to be reverse scored
sBFI6r <- 6 - RSPdata$sBFI6
sBFI21r <- 6 - RSPdata$sBFI21
sBFI31r <- 6 - RSPdata$sBFI31
    # Now put them all into one data.frame
ext.vars <- data.frame(RSPdata$sBFI1, sBFI6r, RSPdata$sBFI11, 
	RSPdata$sBFI16, sBFI21r, RSPdata$sBFI26, sBFI31r, RSPdata$sBFI36)
head(ext.vars) # Looks good
  # Get the internal consistency stats using the alpha() function in the
  # psych package
alpha(ext.vars)
  # We can also get alpha from the correlation/covariance matrices
alpha.cov(cor(ext.vars))  # Standardized Alpha
alpha.cov(cov(ext.vars))  # Raw Alpha
	



