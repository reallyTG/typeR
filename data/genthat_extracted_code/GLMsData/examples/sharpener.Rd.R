library(GLMsData)


### Name: sharpener
### Title: Sharpener data
### Aliases: sharpener
### Keywords: datasets

### ** Examples

	### The data are actually random numbers, generated in R as follows:
	nxvars <- 10   # The number of explanatory variables
	nobs <- 15	   # The number of observations
	set.seed(5000) # To ensure reproducibility
	
	# Ensure the response is normally distributed
	y  <- round( rnorm( nobs,0,1), 2) + 10	
	
	# The explanatory variables
	rd <- runif( nxvars*nobs, 0, 1)
	rd <- round( matrix( rd, ncol=nxvars), 2)
	
	# Convert to a dataframe
	rdf <- data.frame( Y=y )
	
	for (i in (1:nxvars)){
		code <- paste( "rdf$X",i," <- rd[,",i,"]", sep="")
		eval( parse(text=code))
	}
	
	head( rdf )
	data(sharpener)
	head( sharpener )



