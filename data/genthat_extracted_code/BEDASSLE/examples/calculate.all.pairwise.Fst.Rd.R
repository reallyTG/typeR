library(BEDASSLE)


### Name: calculate.all.pairwise.Fst
### Title: Calculates unbiased pairwise Fst between all sampled populations
### Aliases: calculate.all.pairwise.Fst

### ** Examples

#With the HGDP dataset
	data(HGDP.bedassle.data)

#Calculate pairwise Fst between all population pairs
	hgdp.pairwise.Fst <- calculate.all.pairwise.Fst(
		HGDP.bedassle.data$allele.counts,
		HGDP.bedassle.data$sample.sizes
	)	

#Plot pairwise Fst against geographic distance
	plot(HGDP.bedassle.data$GeoDistance,
		hgdp.pairwise.Fst,
		pch=19,
		col=HGDP.bedassle.data$EcoDistance+1,
		ylab="pairwise Fst",
		xlab="geographic distance",
		main="isolation by distance")
			legend(x="bottomright",pch=19,col=c(1,2),
				legend=c("same side of Himalayas",
						"opposite sides of Himalayas"))



