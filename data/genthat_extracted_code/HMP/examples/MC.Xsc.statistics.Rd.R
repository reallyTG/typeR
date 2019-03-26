library(HMP)


### Name: MC.Xsc.statistics
### Title: Size and Power for the One Sample RAD Probability-Mean Test
###   Comparison
### Aliases: MC.Xsc.statistics

### ** Examples

	data(saliva)
	data(throat) 
	data(tonsils)
	
	### Get a list of dirichlet-multinomial parameters for the data
	fit.saliva <- DM.MoM(saliva) 
	fit.throat <- DM.MoM(throat)
	fit.tonsils <- DM.MoM(tonsils) 
	
	### Set up the number of Monte-Carlo experiments
	### We use 1 for speed, should be at least 1,000
	numMC <- 1
	
	### Generate the number of reads per sample
	### The first number is the number of reads and the second is the number of subjects
	nrs <- rep(15000, 25)
	
	### Computing size of the test statistics (Type I error)
	pval1 <- MC.Xsc.statistics(nrs, numMC, fit.tonsils, fit.saliva$pi, "hnull")
	pval1
	
	### Computing Power of the test statistics (Type II error)
	pval2 <- MC.Xsc.statistics(nrs, numMC, fit.throat, fit.tonsils$pi)
	pval2



