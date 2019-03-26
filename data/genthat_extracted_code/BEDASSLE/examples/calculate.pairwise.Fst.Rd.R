library(BEDASSLE)


### Name: calculate.pairwise.Fst
### Title: Calculates unbiased pairwise Fst between a pair of populations
### Aliases: calculate.pairwise.Fst

### ** Examples

#With the HGDP dataset
	data(HGDP.bedassle.data)

#Draw 2 populations at random from the Eurasian HGDP dataset
	pop1 <- sample(nrow(HGDP.bedassle.data$allele.counts),1)
	pop2 <- sample(nrow(HGDP.bedassle.data$allele.counts),1)

#Calculate unbiased Fst between them
	pairwise.Fst <- calculate.pairwise.Fst(
		HGDP.bedassle.data$allele.counts[c(pop1,pop2),],
		HGDP.bedassle.data$sample.sizes[c(pop1,pop2),]	
	)

#Print that Fst to the console
	print(sprintf("Fst between the %s population and the %s population is %s",
		HGDP.bedassle.data$hgdp.metadata[pop1,1],
		HGDP.bedassle.data$hgdp.metadata[pop2,1],
		round(pairwise.Fst,3))
	 )



