library(HMP)


### Name: MC.Xmc.statistics
### Title: Size and Power of Several Sample RAD-Probability Mean Test
###   Comparison
### Aliases: MC.Xmc.statistics

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
	group.Nrs <- list(nrsGrp1, nrsGrp2)
	
	group.theta <- c(0.01, 0.05)
	pi0 <- fit.saliva$pi
	
	### Computing size of the test statistics (Type I error)
	pval1 <- MC.Xmc.statistics(group.Nrs, numMC, pi0, group.theta=group.theta, type="hnull")
	pval1
	
	### Computing Power of the test statistics (Type II error)
	group.pi <- rbind(fit.throat$pi, fit.tonsils$pi)
	pval2 <- MC.Xmc.statistics(group.Nrs, numMC, pi0, group.pi, group.theta)
	pval2



