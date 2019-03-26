library(HMP)


### Name: MC.Xdc.statistics
### Title: Size and Power for the Several-Sample DM Parameter Test
###   Comparison
### Aliases: MC.Xdc.statistics

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
	alphap <- fit.saliva$gamma
	pval1 <- MC.Xdc.statistics(group.Nrs, numMC, alphap, "hnull")
	pval1
	
	### Computing Power of the test statistics (Type II error)
	alphap <- rbind(fit.saliva$gamma, fit.throat$gamma, fit.tonsils$gamma)
	pval2 <- MC.Xdc.statistics(group.Nrs, numMC, alphap)
	pval2



