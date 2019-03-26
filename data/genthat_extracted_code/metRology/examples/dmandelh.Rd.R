library(metRology)


### Name: Mandel-h
### Title: Mandel's h statistic.
### Aliases: dmandelh pmandelh qmandelh rmandelh
### Keywords: distribution

### ** Examples

	#Generate the 95% and 99% quantiles for comparison with tables in 
	#ISO 5725:1996 Part 2:
	n <- 3:30
	round(qmandelh(0.975, n), 2) #95% 2-tailed

	round(qmandelh(0.995, n), 2) #99% 2-tailed
	



