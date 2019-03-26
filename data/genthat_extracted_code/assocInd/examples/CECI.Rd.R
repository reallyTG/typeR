library(assocInd)


### Name: CECI
### Title: The Combined Error Corrected Index
### Aliases: CECI

### ** Examples

	
	# Simulated values
	x <- ya <- yb <- yab <- 10
	ynull <- 0
	
	# Set parameters to make equivalent to the SRI
	psi <- 1.0
	w <- 0
	E <- 0	

	# Calculate the group location error corrected index
	CECI(x,ya,yb,yab,ynull,w,psi,E)
	



