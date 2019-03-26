library(HMP)


### Name: MC.ZT.statistics
### Title: Size and Power of Goodness of Fit Test: Multinomial vs.
###   Dirichlet-Multinomial
### Aliases: MC.ZT.statistics

### ** Examples

	data(saliva) 
	
	### Get a list of dirichlet-multinomial parameters for the data
	fit.saliva <- DM.MoM(saliva) 
	
	### Set up the number of Monte-Carlo experiments
	### We use 1 for speed, should be at least 1,000
	numMC <- 1
	
	### Generate the number of reads per sample
	### The first number is the number of reads and the second is the number of subjects
	nrs <- rep(15000, 25)
	
	### Computing size of the test statistics (Type I error)
	pval1 <- MC.ZT.statistics(nrs, numMC, fit.saliva, "hnull") 
	pval1
	
	### Computing Power of the test statistics (Type II error)
	pval2 <- MC.ZT.statistics(nrs, numMC, fit.saliva)
	pval2



