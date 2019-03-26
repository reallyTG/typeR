library(HMP)


### Name: MC.Xoc.statistics
### Title: Size and Power of Several Sample-Overdispersion Test Comparisons
### Aliases: MC.Xoc.statistics

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
	nrsGrp1 <- rep(12000, 9)
	nrsGrp2 <- rep(12000, 11)
	nrsGrp3 <- rep(12000, 12)
	group.Nrs <- list(nrsGrp1, nrsGrp2, nrsGrp3)
	
	### Computing size of the test statistics (Type I error)
	alphap <- fit.tonsils$gamma
	pval1 <- MC.Xoc.statistics(group.Nrs, numMC, alphap, "hnull")
	pval1
	
	## Not run: 
##D 		### Computing Power of the test statistics (Type II error)
##D 		alphap <- rbind(fit.saliva$gamma, fit.throat$gamma, fit.tonsils$gamma)
##D 		pval2 <- MC.Xoc.statistics(group.Nrs, numMC, alphap, "ha")
##D 		pval2
##D 	
## End(Not run)



