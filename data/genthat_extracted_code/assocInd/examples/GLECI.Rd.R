library(assocInd)


### Name: GLECI
### Title: The Group Location Error Corrected Index
### Aliases: GLECI

### ** Examples

	
	# Simulated values
	x <- ya <- yb <- yab <- 10
	ynull <- 0
	
	# Set w (here make the GLECI equal to the SRI)
	w <- 1.0

	# Calculate the group location error corrected index
	GLECI(x,ya,yb,yab,ynull,w)
	



