library(HMP)


### Name: MC.Xmcupo.statistics
### Title: Size and Power of Several Sample RAD-Probability Mean Test
###   Comparisons: Unknown Vector of Proportion
### Aliases: MC.Xmcupo.statistics

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
	Nrs1 <- rep(12000, 10)
	Nrs2 <- rep(12000, 19)
	group.Nrs <- list(Nrs1, Nrs2)
	
	group.theta <- c(fit.throat$theta, fit.tonsils$theta)
	pi0 <- fit.saliva$pi
	
	### Computing size of the test statistics (Type I error)
	group.theta <- c(fit.throat$theta, fit.tonsils$theta)
	pval1 <- MC.Xmcupo.statistics(group.Nrs, numMC, pi0, group.theta=group.theta, type="hnull")
	pval1
	
	### Computing Power of the test statistics (Type II error)
	group.pi <- rbind(fit.throat$pi, fit.tonsils$pi)
	pval2 <- MC.Xmcupo.statistics(group.Nrs, numMC, group.pi=group.pi, group.theta=group.theta)
	pval2



