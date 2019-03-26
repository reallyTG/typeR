library(BEDASSLE)


### Name: MCMC
### Title: Runs the Markov chain Monte Carlo with the standard (Binomial)
###   model
### Aliases: MCMC

### ** Examples

#With the HGDP dataset and mcmc operators
	data(HGDP.bedassle.data)
	data(mcmc.operators)

#The value of delta may set off warnings, 
#so temporarily disable warnings.
	op <- options("warn")
	options(warn = -1)
	
#Call the Markov chain Monte Carlo for the standard model	
	MCMC(
		counts = HGDP.bedassle.data$allele.counts,
		sample_sizes = HGDP.bedassle.data$sample.sizes,
		D = HGDP.bedassle.data$GeoDistance,
		E = HGDP.bedassle.data$EcoDistance,
		k = HGDP.bedassle.data$number.of.populations,
		loci = HGDP.bedassle.data$number.of.loci,
		delta = mcmc.operators$delta,
		aD_stp = mcmc.operators$aD_stp,
		aE_stp = mcmc.operators$aE_stp,
		a2_stp = mcmc.operators$a2_stp,
		thetas_stp = mcmc.operators$thetas_stp,
		mu_stp = mcmc.operators$mu_stp,
		ngen = mcmc.operators$ngen,
		printfreq = mcmc.operators$printfreq,
		savefreq = mcmc.operators$savefreq,
		samplefreq = mcmc.operators$samplefreq,
		directory = NULL,
		prefix = mcmc.operators$prefix,
		continue = FALSE,
		continuing.params = NULL
	)

#Re-enable warnings
	options(op)



